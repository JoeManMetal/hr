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
        <h2><?php echo $staff_name; ?></h2>
        
        
        <?php if ($addresses) { ?>
          <?php foreach ($addresses as $result) { ?>
            <table class="table table-bordered table-hover">
                <tr>
                  <th class="text-left" colspan="2"><?php echo $result['year'] ?></td>
                </tr>
                <tr>
                  <td class="text-left"><?php echo $leave_carryover['name']; ?></td>
                  <td class="text-right"><?php echo $leave_carryover['value']; ?></td>
                </tr>
                <tr>
                  <td class="text-left"><?php echo $leave_entitlement['name']; ?></td>
                  <td class="text-right"><?php echo $leave_entitlement['value']; ?></td>
                </tr>
                <tr>
                  <td class="text-left">2015 Total AL available 2015-12-31</td>
                  <td class="text-right"><?php echo $total_al; ?></td>
                </tr>
                <tr>
                  <td class="text-left">Total Days Left as at 2015-12-31</td>
                  <td class="text-right"><?php echo $total_al_left_as_at_yearend; ?></td>
                </tr>
                <tr>
                  <td class="text-left">2015 AL available as at today</td>
                  <td class="text-right"><?php echo $total_al_as_at_today; ?></td>
                </tr>

                <tr>
                  <td class="text-left">Total Days Left as at today</td>
                  <td class="text-right"><?php echo $total_al_left_as_at_today; ?></td>
                </tr>
                <tr>
                  <td class="text-left">Total Taken in 2015</td>
                  <td class="text-right"><?php echo $total_taken; ?></td>
                </tr>
            </table>
            <?php foreach ($addresses as $result) { ?>
                <div class="row" style="display: none;">

                <?php $m = 0; foreach ($result['custom_field'] as $custom_field) { ?>
                    <?php if ($m % 4 == 0) { ?>
                        <div class="col-md-4">
                    <?php } ?>

                        <div style="float: left; width: 25%; text-align: center;"><div style="padding: 8px; "><?php echo $custom_field['name']; ?></div><div style="padding: 8px; border-top: 1px solid #cdcdcd;"><?php echo $custom_field['value']; ?></div></div>

                    <?php $m++; if ($m % 4 == 0) { ?>
                        <div style="clear:left;"></div>
                        </div>
                    <?php } ?>
                <?php }  ?>
                </div>
            <?php } ?>

        <?php } ?>

        <div style="margin: 50px 0 0 0;">
            <div class="row">
                <?php echo $annual_calendar; ?>
            </div>
        </div>
        
        
        
        
        
        
      <?php } else { ?>
      <p><?php echo $text_empty; ?></p>
      <?php } ?>
      <div class="buttons clearfix">
        <div class="pull-left"><a href="<?php echo $back; ?>" class="btn btn-default"><?php echo $button_back; ?></a></div>

      </div>
<script>
$('.event-calendar > tr > td').each(function(idx){
    $(this).height($(this).width())
    $(this).css('line-height', $(this).width() + 'px')
})
$( window ).resize(function() {
    $('.event-calendar > tr > td').each(function(idx){
        $(this).height($(this).width())
        $(this).css('line-height', $(this).width() + 'px')
    })
})
</script>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>
