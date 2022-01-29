  <!-- Modal -->
  <div class="modal fade" id="exportModal" tabindex="-1" aria-labelledby="exportModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header bg-success">
          <h5 class="modal-title" id="exportModalLabel">Exportar csv</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
            <form method="GET" action="/export">
                @include('filtros')
                <button type="submit" class="btn btn-success">Export</button>
            </form>
        </div>
      </div>
    </div>
  </div>