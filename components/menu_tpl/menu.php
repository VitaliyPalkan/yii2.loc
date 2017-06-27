
<div class="panel panel-default">
    <div class="panel-heading">
        <h4 class="panel-title">
            <a data-toggle="collapse" data-parent="#accordian" href="#<?=lcfirst($category['name'])?>">
                <?php if ( isset($category['childs'])) : ?>
                    <span class="badge pull-right"><i class="fa fa-plus"></i></span>
                <?php endif;?>
                <a href="<?= \yii\helpers\Url::to(['category/view', 'id' => $category['id']]);?>"><?= $category['name']?></a>
            </a>
        </h4>
    </div>
    <?php if ( isset($category['childs'])) : ?>
    <div id="<?=lcfirst($category['name'])?>" class="panel-collapse collapse">
        <div class="panel-body">
            <ul>
                <?php foreach ($category['childs'] as $child) : ?>
                <li><a href="<?= \yii\helpers\Url::to(['category/view', 'id' => $child['id']]);?>"><?= $child['name']?></a></li>
                <?php endforeach; ?>
            </ul>
        </div>
    </div>
    <?php endif;?>
</div>
