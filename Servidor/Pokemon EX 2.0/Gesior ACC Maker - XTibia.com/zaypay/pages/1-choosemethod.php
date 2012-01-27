<?php include ('./pages/0-header.php'); ?>

<form name="formZaypayLocale" method="post">
<h2>Choose your country and language</h2>
<table width="100%">
  <tr>
    <td width="50%">
      <select name="locale_country">
    <?php foreach ($locales['countries'] As $country) { ?>
      <option value="<?= $country['code'] ?>"<?= (($country['code'] == $Zaypay->getLocale('country')) ? ' selected' : '') ?> /> <?= $country['name'] ?></option>
    <?php } ?>
      </select>
      <input type="submit" name="submit" value="Change" />
    </td>
    <td width="50%" align="right">
      <select name="locale_language">
    <?php foreach ($locales['languages'] As $language) { ?>
      <option value="<?= $language['code'] ?>"<?= (($language['code'] == $Zaypay->getLocale('language')) ? ' selected' : '') ?> /> <?= $language['english-name'] ?> (<?= $language['native-name'] ?>)</option>
    <?php } ?>
      </select>
      <input type="submit" name="submit" value="Change" />
    </td>
  </tr>
<table>
</form>

<h2>Choose your payment method</h2>
<form name="formZaypayMethod" method="post">
<table width="70%">
  <tr>
    <td width="100%" valign="top">
    <?php foreach ($payment_methods As $method) { ?>
      <label><input type="radio" name="paymentmethod" value="<?= $method['payment-method-id'] ?>" /> <?= $method['very-short-instructions-with-amount'] ?></label><br />
    <?php } ?>
    </td>
  </tr>
<table>
<input type="hidden" name="locale" value="<?= $Zaypay->getLocale() ?>" />

<input type="hidden" name="action" value="pay" />

<div class="button">
  <input type="submit" name="submit" value="Continue &raquo;" />
</div>
</form>

<?php include ('./pages/0-footer.php'); ?>