<table id="table" class="table table-striped table-hover">
    <thead>
      <tr>
        <th >Voucher#</th>
        <th >CBA</th>
        <th >Brand</th>
        <th >Account Name</th>
        <th >Issuer Name</th>
        <th >Voucher Status</th>
        <th >Past Due</th>
        <th >Payment File</th>
        <th >Customer Last Name</th>
        <th >Confirmation #</th>
        <th >Issue IATA</th>
        <th >Gross Amount</th>
        <th >GSA Net Amount</th>
        <th >ABG Net Amount</th>
        <th >User</th>
        <th >Create Date</th>
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
                <td>{{$item->past_due}}</td>
                <td>{{$item->paymentFile ? $item->paymentFile->paymentFileStatus->name : ""}}</td>
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


