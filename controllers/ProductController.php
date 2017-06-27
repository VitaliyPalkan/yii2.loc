<?php

namespace app\controllers;
use app\models\Category;
use app\models\Product;
use yii\web\HttpException;
use Yii;

class ProductController extends AppController
{
    public function actionView($id){
        //$id = Yii::$app->request->get('id');
        //$product = Product::find()->with('category')->where(['id' => $id])->limit(1)->one();
        $product = Product::findOne($id);

        if (empty($product)){
            throw new HttpException(404, 'This product is empty');
        }

        $hits = Product::find()->where(['hit' => 1])->limit(7)->all();
        $this->setMeta('E-shopper | ' . $product->name, $product->keywords, $product->description);

        return $this->render('view', [
            'product' => $product,
            'hits' => $hits,

        ]);
    }
}