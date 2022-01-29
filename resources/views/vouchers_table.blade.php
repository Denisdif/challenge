<table id="table" class="table table-striped table-hover">
    <thead>
      <tr>
        <th >Voucher#</th>
        <th >CBA</th>
        <th >@lang('mensajes.brand')</th>
        <th >@lang('mensajes.accountName')</th>
        <th >@lang('mensajes.issuerName')</th>
        <th >@lang('mensajes.voucherStatus')</th>
        <th >@lang('mensajes.pastDue')</th>
        <th >@lang('mensajes.paymentFile')</th>
        <th >@lang('mensajes.customerLastName')</th>
        <th >@lang('mensajes.confirmation') #</th>
        <th >Issue IATA</th>
        <th >@lang('mensajes.grossAmount')</th>
        <th >@lang('mensajes.gsaNetAmount')</th>
        <th >@lang('mensajes.abgNetAmount')</th>
        <th >@lang('mensajes.user')</th>
        <th >@lang('mensajes.createDate')</th>
      </tr>
    </thead>
    <tbody>
        @foreach ($vouchers as $item)
            <tr>
                <td>{{$item->number}}</td>
                <td>{{$item->account}}</td>
                <td>{{$item->company->name}}</td>
                <td>{{$item->gsaOrganization->name}}</td>
                <td>{{$item->organization->name}}</td>
                <td>{{$item->voucherStatus->name}}</td>
                <td>{{$item->past_due == 1 ? "Past Due" : ""}}</td>
                <td>{{$item->paymentFile ? $item->paymentFile->paymentFileStatus->name : "-"}}</td>
                <td>{{$item->booking ? $item->booking->last_name : ""}}</td>
                <td>{{$item->booking ? $item->booking->number : ""}}</td>
                <td>{{$item->iata_code}}</td>
                <td>{{$item->gross_amount}}</td>
                <td>{{$item->gsa_comission_amount}}</td>
                <td>{{$item->abg_net_amount}}</td>
                <td>{{$item->user->name}} {{$item->user->last_name}}</td>
                <td>{{$item->issue_date}}</td>
            </tr>
        @endforeach
    </tbody>
</table>


