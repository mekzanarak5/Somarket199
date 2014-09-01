<a href="home.jsp"><img src="pic/logooo.png" class="img-responsive"/></a>
<div style=" border: 1px solid #ffffff;border-radius: 15px;height: 800px;background: #ffffff">
    <h6 class="col-md-3">Catagory</h6>
    <div class="col-md-12">
        <div class="ui accordion">
            <div class="active title">
                <i class="dropdown icon"></i>
                Level 1
            </div>
            <div class="active content">                                    
                <div class="accordion">
                    <div class="active title">
                        <i class="dropdown icon"></i>
                        Level 1A
                    </div>
                    <div class="active content">
                        <p>Level 1A Contents</p>
                        <div class="accordion">
                            <div class="title">
                                <i class="dropdown icon"></i>
                                Level 1A-A
                            </div>
                            <div class="content">
                                Level 1A-A Contents
                            </div>
                            <div class="title">
                                <i class="dropdown icon"></i>
                                Level 1A-B
                            </div>
                            <div class="content">
                                Level 1A-B Contents
                            </div>
                        </div>
                    </div>
                    <div class="title">
                        <i class="dropdown icon"></i>
                        Level 1B
                    </div>
                    <div class="content">
                        Level 1B Contents
                    </div>
                    <div class="title">
                        <i class="dropdown icon"></i>
                        Level 1C
                    </div>
                    <div class="content">
                        Level 1C Contents
                    </div>
                </div>
            </div>   
        </div>
    </div>
    <form>
    <div class="col-xs-12">
        <select name="herolist" class="select-block">
            <option value="0" selected>Choose Category</option>
            <option value="1">Computer</option>
            <option value="2">Mobile & Tablet</option>
            <option value="3">Camera</option>
        </select>
    </div>
    <h6 class="col-md-12">Price Range</h6>
    <div class="col-xs-12">
        <div class="row">
            <div class="col-md-6"><input class="form-control col-xs-5 pull-left" type="text" name="price1"></div>
            <div class="col-md-6"><input class="form-control col-xs-5 pull-right" type="text" name="price2"></div>
        </div>
    </div>
    <div class="col-xs-7">
        <br>
        <button type="submit" class="btn btn-block btn-lg btn-info">Search</button>
    </div>
    </form>
</div>
