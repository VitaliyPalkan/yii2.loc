<?php

namespace app\modules\admin\models;

use Yii;

/**
 * This is the model class for table "order".
 *
 * @property integer $id
 * @property string $create_at
 * @property string $update_at
 * @property integer $qty
 * @property integer $sum
 * @property integer $status
 * @property string $name
 * @property string $email
 * @property string $phone
 * @property string $adress
 *
 * @property OrderItem[] $orderItems
 */
class Order extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'order';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['create_at', 'update_at', 'qty', 'sum', 'name'], 'required'],
            [['create_at', 'update_at'], 'safe'],
            [['qty', 'sum', 'status'], 'integer'],
            [['name', 'email', 'phone', 'adress'], 'string', 'max' => 255],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => '№ Заказа',
            'create_at' => 'Дата создания',
            'update_at' => 'Дата изменения',
            'qty' => 'Количество',
            'sum' => 'Сумма',
            'status' => 'Статус',
            'name' => 'Имя',
            'email' => 'E-mail',
            'phone' => 'Телефон',
            'adress' => 'Адрес',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getOrderItems()
    {
        return $this->hasMany(OrderItem::className(), ['order_id' => 'id']);
    }
}
