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
                <div class="row">

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
<?php
function draw_calendar($month,$year,$annual_leave = array()){

	/* draw table */
	$calendar = '<table>';

	/* table headings */
	$headings = array('S','M','T','W','T','F','S');
	$calendar.= '<thead class="event-days"><tr><td>'.implode('</td><td>',$headings).'</td></tr></thead><tbody class="event-calendar">';

	/* days and weeks vars now ... */
	$running_day = date('w',mktime(0,0,0,$month,1,$year));
	$days_in_month = date('t',mktime(0,0,0,$month,1,$year));
	$days_in_this_week = 1;
	$day_counter = 0;
	$dates_array = array();

	/* row for week one */
	$calendar.= '<tr>';


	/* print "blank" days until the first of the current week */
	for($x = 0; $x < $running_day; $x++):
		$calendar.= '<td class="calendar-day-np"> </td>';
		$days_in_this_week++;
	endfor;

	/* keep going with days.... */
	for($list_day = 1; $list_day <= $days_in_month; $list_day++) {

		if(in_array( $list_day.'-'.$month.'-'.$year,$annual_leave))
			$calendar.= '<td class="current-day">';
		else
			$calendar.= '<td>';
			/* add in the day number */
			//$calendar.= '<div>'.$list_day.'</div>';
			$calendar.= $list_day;
			/** QUERY THE DATABASE FOR AN ENTRY FOR THIS DAY !!  IF MATCHES FOUND, PRINT THEM !! **/
			//$calendar.= str_repeat('<p> </p>',2);

		$calendar.= '</td>';
		if($running_day == 6):
			$calendar.= '</tr>';
			if(($day_counter+1) != $days_in_month):
				$calendar.= '<tr>';
			endif;
			$running_day = -1;
			$days_in_this_week = 0;
		endif;
		$days_in_this_week++; $running_day++; $day_counter++;
	}

	/* finish the rest of the days in the week */
	if($days_in_this_week < 8):
		for($x = 1; $x <= (8 - $days_in_this_week); $x++):
			$calendar.= '<td class="calendar-day-np"> </td>';
		endfor;
	endif;

	/* final row */
	$calendar.= '</tr>';

	/* end the table */
	$calendar.= '</tbody></table>';

	/* all done, return result */
	return $calendar;
}
$annual_leave = array('2-3-2015', '4-4-2015');


for($d = 1; $d < 5; $d++){
?>
	<div class="col-xs-12 col-sm-6 col-md-6  col-lg-3 ">
		<div class="calendar hidden-print">
		<header>
			<h2 class="month"><?php echo date('M', strtotime(date('Y').'-'.$d.'-1')) ?></h2>
		</header>
<?php

echo draw_calendar($d, date('Y'), $annual_leave);
?>
	</div>
	</div>
	<?php if($d == 2){ ?>
	<div class="clearfix hidden-lg"></div>
	<?php } ?>

<?php
}
?>
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
