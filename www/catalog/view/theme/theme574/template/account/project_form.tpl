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


            <div class="form-group">
              <label class="col-sm-2 control-label" for="input-description<?php echo $language['language_id']; ?>"><?php echo $entry_description; ?></label>
              <div class="col-sm-10">
                <textarea name="project_description[<?php echo $language['language_id']; ?>][description]" placeholder="<?php echo $entry_description; ?>" id="input-description<?php echo $language['language_id']; ?>"><?php echo isset($project_description[$language['language_id']]) ? $project_description[$language['language_id']]['description'] : ''; ?></textarea>
              </div>
            </div>


            <div class="form-group required">
              <label class="col-sm-2 control-label" for="input-project_type"><?php echo $entry_project_type; ?></label>
              <div class="col-sm-10">
                <input type="text" name="project_type" value="<?php echo $project_type; ?>" placeholder="<?php echo $entry_project_type; ?>" id="input-project_type" class="form-control" />
                <?php if ($error_project_type) { ?>
                <div class="text-danger"><?php echo $error_project_type; ?></div>
                <?php } ?>
              </div>
            </div>
            <div class="form-group required">
              <label class="col-sm-2 control-label" for="input-project_source"><?php echo $entry_project_source; ?></label>
              <div class="col-sm-10">
                <input type="text" name="project_source" value="<?php echo $project_source; ?>" placeholder="<?php echo $entry_project_source; ?>" id="input-project_source" class="form-control" />
                <?php if ($error_project_source) { ?>
                <div class="text-danger"><?php echo $error_project_source; ?></div>
                <?php } ?>
              </div>
            </div>
            <div class="form-group required">
              <label class="col-sm-2 control-label" for="input-project_source"><?php echo $entry_project_amount; ?></label>
              <div class="col-sm-10">
                <input type="text" name="project_amount" value="<?php echo $project_amount; ?>" placeholder="<?php echo $entry_project_amount; ?>" id="input-project_amount" class="form-control" />
                <?php if ($error_project_amount) { ?>
                <div class="text-danger"><?php echo $error_project_amount; ?></div>
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
