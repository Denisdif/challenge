<div class="row">
    <div class="mb-3 col-md-4">
        <label for="number" class="form-label">Voucher#</label>
        <input type="text" class="form-control" id="number" name="number">
    </div>
    <div class="mb-3 col-md-4">
        <label for="account" class="form-label">@lang('mensajes.account')</label>
        <input type="text" class="form-control" id="account" name="account">
    </div>
    <div class="mb-3 col-md-4">
        <label for="brand" class="form-label">@lang('mensajes.brand')</label>
        <select class="form-select" name="brand" id="brand">
            <option value="">@lang('mensajes.all')</option>
            <option value="Avis">Avis</option>
            <option value="Budget">Budget</option>
        </select>
    </div>
    <div class="mb-3 col">
        <label for="create_date_start" class="form-label">@lang('mensajes.createDateStart')</label>
        <input type="date" class="form-control" id="create_date_start" name="create_date_start">
    </div>
    <div class="mb-3 col">
        <label for="create_date_end" class="form-label">@lang('mensajes.createDateEnd')</label>
        <input type="date" class="form-control" id="create_date_end" name="create_date_end">
    </div>
</div>