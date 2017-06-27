<?php

namespace app\controllers;
use app\models\Product;
use app\models\Cart;
use app\models\Order;
use app\models\OrderItem;
use Yii;

class CartController extends AppController
{
    public function actionAdd(){
        $id = Yii::$app->request->get('id');
        $qty = (int)Yii::$app->request->get('qty');
        $qty = !$qty ? 1 : $qty;
        $product = Product::findOne($id);
        if (empty($product)) return false;

        $session = Yii::$app->session;
        $session->open();

        $cart = new Cart();
        $cart->addToCart($product, $qty);
        if (!Yii::$app->request->isAjax){
            return $this->redirect(Yii::$app->request->referrer);
        }
        $this->layout = false;
        return $this->render('cart-modal', [
            'session' => $session,
        ]);
    }
    public function actionDelete(){
        $this->layout = false;
        $session = Yii::$app->session;
        $session->open();
        $session->remove('cart');
        $session->remove('cart.qty');
        $session->remove('cart.sum');
        return $this->render('cart-modal', [
            'session' => $session,
        ]);
    }

    public function actionDelItem(){
        $this->layout = false;
        $id = Yii::$app->request->get('id');
        $session = Yii::$app->session;
        $session->open();
        $cart = new Cart();
        $cart->reculc($id);
        return $this->render('cart-modal', [
            'session' => $session,
        ]);
    }
    public function actionShow(){
        $this->layout = false;
        $session = Yii::$app->session;
        $session->open();
        return $this->render('cart-modal', [
            'session' => $session,
        ]);
    }
    public function actionShows(){
        $session = Yii::$app->session;
        $session->open();
        return $session['cart.qty'];
    }

    public function actionView(){
        $session = Yii::$app->session;
        $session->open();
        $this->setMeta('Корзина');
        $order = new Order();
        if ($order->load(Yii::$app->request->post())){
            $order->qty = $session['cart.qty'];
            $order->sum = $session['cart.sum'];
            if ($order->save()){
                $this->saveOrderItems($session['cart'], $order->id);
                Yii::$app->session->setFlash('success', 'Ваш заказ принят, Менеджер вскоре свяжется с Вами.');
                Yii::$app->mailer->compose('order', ['session' => $session])
                ->setFrom(['ischenkovm@mail.ru' => 'yii2.loc'])
                ->setTo($order->email)
                ->setSubject('Заказ')
                ->send();
                $session->remove('cart');
                $session->remove('cart.qty');
                $session->remove('cart.sum');
                return $this->refresh();
            } else {
                Yii::$app->session->setFlash('error', 'Ошибка оформления заказа.');
            }
        }
        return $this->render('view', [
            'session' => $session,
            'order' => $order,
        ]);
    }
    protected function saveOrderItems($items, $order_id){
        foreach ($items as $id => $item) {
            $order_items = new OrderItem();
            $order_items->order_id = $order_id;
            $order_items->product_id = $id;
            $order_items->name = $item['name'];
            $order_items->price = $item['price'];
            $order_items->qty_item = $item['qty'];
            $order_items->sum_item = $item['price'] * $item['qty'];
            $order_items->save();
        }
    }
}