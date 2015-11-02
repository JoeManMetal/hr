<?php if ($error_warning) { ?>
<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
  <button type="button" class="close" data-dismiss="alert">&times;</button>
</div>
<?php } ?>
<?php if ($success) { ?>
<div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
  <button type="button" class="close" data-dismiss="alert">&times;</button>
</div>
<?php } ?>
<div class="table-responsive">
  <table class="table table-bordered table-hover">
    <thead>
      <tr>
        <td class="text-left">Leave <?php //echo $column_date_added; ?>(<?php echo $balance; ?>)</td>
        <td class="text-left"><?php echo $column_description; ?></td>
        <td class="text-right">Day<?php //echo $column_points; ?></td>
        <td class="text-right">Type</td>
        <td class="text-right"><?php echo $column_action; ?></td>
      </tr>
    </thead>
    <tbody>
      <?php if ($leave_records) { ?>
      <?php foreach ($leave_records as $leave_record) { ?>
      <tr id="leave_record_<?php echo $leave_record['customer_leave_record_id'] ?>">
        <td class="text-left"><?php echo $leave_record['date_leave']; ?></td>
        <td class="text-left"><?php echo $leave_record['description']; ?></td>
        <td class="text-right"><?php echo $leave_record['fullday']; ?></td>
        <td class="text-right"><?php echo $leave_record['fullday']; ?></td>
        <td class="text-right"><button type="button" value="<?php echo $leave_record['customer_leave_record_id'] ?>" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-success btn-xs button-leave-record-delete"><i class="fa fa-plus-circle"></i> <?php echo $text_delete; ?></button></td>
      </tr>
      <?php } ?>

      <?php } else { ?>
      <tr>
        <td class="text-center" colspan="5"><?php echo $text_no_results; ?></td>
      </tr>
      <?php } ?>
    </tbody>
  </table>
</div>
<div class="row">
  <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
  <div class="col-sm-6 text-right"><?php echo $results; ?></div>
</div>
