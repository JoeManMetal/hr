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
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
        <h2><?php //echo $text_address_book; ?></h2>
        <?php if ($addresses) { ?>

          <?php
            $current_year = date('Y');
            for($i = $current_year; $i >= 2015; $i-- ) {
                $year_array[] = $i;
            }
            $y = 0;
          ?>
          <?php foreach ($addresses as $result) { ?>
            <table class="table table-bordered table-hover">
            <tr>
              <th class="text-left" colspan="2"><?php echo $year_array[$y] ?></td>
            </tr>
            <?php foreach ($result['custom_field'] as $custom_field) { ?>
                <tr>
                  <td class="text-left"><?php echo $custom_field['name']; ?></td>
                  <td class="text-right"><?php echo $custom_field['value']; ?></td>
                </tr>
            <?php } ?>
            </table>
        <?php $y++; } ?>

      <?php } else { ?>
      <p><?php echo $text_empty; ?></p>
      <?php } ?>
      <div class="buttons clearfix">
        <div class="pull-left"><a href="<?php echo $back; ?>" class="btn btn-default"><?php echo $button_back; ?></a></div>

      </div>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>
