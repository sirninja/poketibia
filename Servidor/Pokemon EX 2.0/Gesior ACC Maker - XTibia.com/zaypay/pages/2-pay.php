<?php include ('./pages/0-header.php'); ?>

<h2><?= ucfirst(strtolower($zaypay_info['very-short-instructions-with-amount'])) ?></h2>

<form name="formZaypayPay" method="post">
  <input type="hidden" name="paymentid" value="<?= $zaypay_info['payment']['id'] ?>" />
  <input type="hidden" name="action" value="paid" />
  <table width="100%">
    <tr>
      <td width="20%" valign="top">Instruction:</td>
      <td width="80%" valign="top"><?= $zaypay_info['long-instructions'] ?></td>
    </tr>
    <tr>
      <td width="20%" valign="top">Status:</td>
      <td width="80%" valign="top"><?= $zaypay_info['status-string'] ?></td>
    </tr>
<?php if (isset($zaypay_info['payment']['verification-needed']) and $zaypay_info['payment']['verification-needed'] == 'true') { ?>
    <tr>
      <td width="20%" valign="top">Verification code:</td>
      <td width="80%" valign="top"><input type="text" name="verification_code" size="6" /></td>
    </tr>
<?php } ?>
  <table>
  
  <div class="button">
    <input type="submit" name="submit" value="Continue &raquo;" />
  </div>
</form>

<?php include ('./pages/0-footer.php'); ?>