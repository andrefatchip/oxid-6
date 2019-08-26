<dl>
    <dt>
        <input id="payment_[{$sPaymentID}]" type="radio" name="paymentid" value="[{$sPaymentID}]" [{if $oView->getCheckedPaymentId() == $paymentmethod->oxpayments__oxid->value}]checked[{/if}]>
        <label for="payment_[{$sPaymentID}]"><b>[{$paymentmethod->oxpayments__oxdesc->value}] [{$oView->fcpoGetFormattedPaymentCosts($paymentmethod)}]</b></label>
    </dt>
    <dd class="[{if $oView->getCheckedPaymentId() == $paymentmethod->oxpayments__oxid->value}]activePayment[{/if}]">
        <input type="hidden" name="fcpo_mode_[{$sPaymentID}]" value="[{$paymentmethod->fcpoGetOperationMode()}]">
        <div class="form-group fcpo_klarna_installment_birthdate">
            <label class="req control-label col-lg-3">[{oxmultilang ident="FCPO_RATEPAY_BIRTHDATE"}]</label>
            <div class="col-lg-9">
                <select name="dynvalue[fcpo_klarna_installment_birthdate_day]">
                    [{foreach from=$oView->fcpoGetDayRange() item='sDay'}]
                        <option value="[{$sDay}]" [{if $sDay == $oView->fcpoGetBirthdayField('day')}]selected[{/if}]>[{$sDay}]</option>
                    [{/foreach}]
                </select>
                &nbsp;
                <select name="dynvalue[fcpo_klarna_installment_birthdate_month]">
                    [{foreach from=$oView->fcpoGetMonthRange() item='sMonth'}]
                        <option value="[{$sMonth}]" [{if $sMonth == $oView->fcpoGetBirthdayField('month')}]selected[{/if}]>[{$sMonth}]</option>
                    [{/foreach}]
                </select>
                &nbsp;
                <select name="dynvalue[fcpo_klarna_installment_birthdate_year]">
                    [{foreach from=$oView->fcpoGetYearRange() item='sYear'}]
                        <option value="[{$sYear}]" [{if $sYear == $oView->fcpoGetBirthdayField('year')}]selected[{/if}]>[{$sYear}]</option>
                    [{/foreach}]
                </select>
            </div>
            <div class="alert alert-info col-lg-offset-3 desc">
                <input name="dynvalue[fcpo_klarna_installment_agreed]" value="agreed" type="checkbox">[{oxmultilang ident="FCPO_KLARNA_DATA_USAGE_AGREE"}]
            </div>
        </div>
        [{block name="checkout_payment_longdesc"}]
            [{if $paymentmethod->oxpayments__oxlongdesc->value}]
                <div class="desc">
                    [{$paymentmethod->oxpayments__oxlongdesc->getRawValue()}]
                </div>
            [{/if}]
        [{/block}]
    </dd>
</dl>
