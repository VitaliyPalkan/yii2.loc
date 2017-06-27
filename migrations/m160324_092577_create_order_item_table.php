<?php
use yii\db\Migration;
class m160324_092577_create_order_item_table extends Migration
{
    public function up()
    {
        $this->createTable('{{%order_item}}', [
            'id' => $this->primaryKey(),
            'product_id' => $this->integer(),
            'order_id' => $this->integer(),
            'name' => $this->string()->notNull(),
            'price' => $this->integer(),
            'qty_item' => $this->integer(),
            'sum_item' => $this->integer(),
        ]);

        $this->addForeignKey('fk-order_item-order_id-order-id', '{{%order_item}}', 'order_id', '{{%order}}', 'id', 'CASCADE');
        $this->addForeignKey('fk-order_item-product_id-product-id', '{{%order_item}}', 'product_id', '{{%product}}', 'id', 'SET NULL');

    }
    public function down()
    {
        $this->dropTable('{{%order_item}}');
    }
}