<?php echo $header; ?>
<div class="container">
    <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
    </ul>
    <?php if ($success) { ?>
    <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?></div>
    <?php } ?>
    <?php if ($error_warning) { ?>
    <div class="alert alert-warning"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?></div>
    <?php } ?>

    <div class="row"><?php echo $column_left; ?>
        <?php if ($column_left && $column_right) { ?>
        <?php $class = 'col-sm-6'; ?>
        <?php } elseif ($column_left || $column_right) { ?>
        <?php $class = 'col-sm-9'; ?>
        <?php } else { ?>
        <?php $class = 'col-sm-12'; ?>
        <?php } ?>
    </div>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
        <?php if ($projects) { ?>
            <div class="table-responsive">
              <table class="table table-bordered table-hover">
                <thead>
                  <tr>

                    <td class="text-left"><?php echo $column_project_name; ?></td>
                    <td class="text-left"><?php echo $column_project_type; ?></td>
                    <td class="text-left"><?php echo $column_project_source; ?></td>
                    <td class="text-right"><?php echo $column_project_amount; ?></td>
                    <td class="text-right"><?php echo $column_date_added; ?></td>
                    <td></td>
                  </tr>
                </thead>
                <tbody>
                  <?php foreach ($projects as $project) { ?>
                  <tr>
                    <td class="text-left"><?php echo $project['name']; ?></td>
                    <td class="text-left"><?php echo $project['project_type']; ?></td>
                    <td class="text-left"><?php echo $project['project_source']; ?></td>
                    <td class="text-right price-tx"><?php echo $project['project_amount']; ?></td>
                    <td class="text-right"><?php echo $project['date_added']; ?></td>
                    <td class="text-right"><a href="<?php echo $project['href']; ?>" class="btn btn-info"><?php echo $button_edit; ?></td>
                  </tr>
                  <?php } ?>
                </tbody>
              </table>
            </div>
            <div class="text-right"><?php echo $pagination; ?></div>
        <?php } else { ?>
        <p><?php echo $text_empty; ?></p>
        <?php } ?>

        <div class="buttons clearfix">
          <div class="pull-left"><a href="<?php echo $back; ?>" class="btn btn-default"><?php echo $button_back; ?></a></div>
          <div class="pull-right"><a href="<?php echo $add; ?>" class="btn btn-primary"><?php echo $button_new_project; ?></a></div>
        </div>
        <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>
