<div class="modal-content">
    <div class="modal-inner">
        <h5><?= $this->lang->line('application_postmaster_test'); ?></h5>
        <pre><?php print_r($trace); ?></pre>
        <div class="alert alert-<?= $msgresult; ?>"><?= $result; ?></div>
    </div>
    <div class="modal-footer">
        <a class="btn" data-dismiss="modal"><?= $this->lang->line('application_close'); ?></a>
    </div>
</div>

