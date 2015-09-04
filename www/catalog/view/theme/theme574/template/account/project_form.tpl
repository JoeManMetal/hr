<?php echo $header; ?>
<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>

  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
        <h2><?php echo $text_project; ?></h2>
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="form-horizontal">
          <fieldset>
            <div class="form-group required">
              <label class="col-sm-2 control-label" for="input-project_name"><?php echo $entry_project_name; ?></label>
              <div class="col-sm-10">
                <input type="text" name="project_name" value="<?php echo $project_name; ?>" placeholder="<?php echo $entry_project_name; ?>" id="input-project_name" class="form-control" />
                <?php if ($error_project_name) { ?>
                <div class="text-danger"><?php echo $error_project_name; ?></div>
                <?php } ?>
              </div>
            </div>
        </fieldset>
        <div class="buttons clearfix">
          <div class="pull-left"><a href="<?php echo $back; ?>" class="btn btn-default"><?php echo $button_back; ?></a></div>
          <div class="pull-right">
            <input type="submit" value="<?php echo $button_continue; ?>" class="btn btn-primary" />
          </div>
        </div>
      </form>
        <?php echo $content_bottom; ?></div>
      <?php echo $column_right; ?></div>
  </div>
  <?php echo $footer; ?>
