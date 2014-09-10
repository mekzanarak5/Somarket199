<form action="SearchProductServlet" method="get">
<div class="row">
    <div class="col-xs-7">
        <div class="form-group">
            <input type="text" value="" name="id" placeholder="Inactive" class="form-control" />
        </div>
    </div>
    <div class="col-xs-3">
        <select name="herolist" class="select-block">
            <option value="" selected>Choose Category</option>
            <option value="1">Computer</option>
            <option value="2">Mobile & Tablet</option>
            <option value="3">Camera</option>
        </select>
    </div>
    <div class="col-xs-2">
        <input type="hidden" name="x" value="0">
        <input type="hidden" name="y" value="5">
        <button type="submit" class="btn btn-block btn-lg btn-info">Search</button>
    </div>
</div>
</form>
