<?php
use yii\db\Migration;
class m160324_092467_create_order_table extends Migration
{
    public function up()
    {
        $this->createTable('{{%order}}', [
            'id' => $this->primaryKey(),
            'create_at' => $this->dateTime(),
            'update_at' => $this->dateTime(),
            'qty' => $this->integer(),
            'sum' => $this->integer(),
            'status' => $this->smallInteger(1)->notNull()->defaultValue(0),
            'name' => $this->string()->notNull(),
            'email' => $this->string(),
            'phone' => $this->string(),
            'adress' => $this->string(),
        ]);

    }
    public function down()
    {
        $this->dropTable('{{%order}}');
    }
}
