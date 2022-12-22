
function changeSearchParam(params){
    var s = new URLSearchParams(window.location.search);
    var hash = location.hash;
    for(var k in params){
        (s.get(k) == null) ? s.append(k, params[k]) : s.set(k, params[k]);
    }
    return location.pathname+"?"+s.toString()+hash;
}

const image = {
    render: function(targetView, fileImage){
        var reader = new FileReader();
        reader.onload = function (e1) {
            $(targetView).attr("src", e1.target.result);
        }
        reader.readAsDataURL(fileImage);
    }
}

/**
 * @param: mType
 * String yyyy/MM/dd HH:mm:ss
 * #yyyy: year
 * #MM: month
 * #dd: day
 * #HH: hour
 * #mm: minutes
 * #ss: seconds
 * */
Date.prototype.format = function(mType){
    const year = this.getFullYear();
    const month = (this.getMonth() < 9) ? "0" + (this.getMonth() + 1) : (this.getMonth() + 1);
    const day = (this.getDate() < 10) ? "0" + this.getDate() : this.getDate();
    const hour = (this.getHours() < 10) ? "0" + this.getHours() : this.getHours();
    const minutes = (this.getMinutes() < 10) ? "0" + this.getMinutes() : this.getMinutes();
    const seconds = (this.getSeconds() < 10) ? "0" + this.getSeconds() : this.getSeconds();
    return mType.replace("yyyy", year)
            .replace("MM", month)
            .replace("dd", day)
            .replace("HH", hour)
            .replace("mm", minutes)
            .replace("ss", seconds)
}

function goPage(_page) {
    document.location.href = changeSearchParam({page: _page});
}

function generalPage(viewName){
    var obj = $(viewName);
    var page = obj.data("page") * 1;
    var count = obj.data("count") * 1;
    var limit = obj.data("limit") * 1;
    if(count < limit){
        //first page
        obj.append(`<li class="page-item"><button type="button" class="btn btn-white page-link active" index="1">1</button></li>`)
    }else{
        var tmp = Math.ceil(count/limit);
        if(page != 1){
            obj.append(`<li class="page-item"><button type="button" class="btn btn-white page-link" index="before"><</button></li>`)
            obj.find(`[index="before"]`).attr("onclick", `goPage(${page-1})`)
        }

        obj.append(`<li class="page-item"><button type="button" class="btn btn-white page-link" index="1" onclick="goPage(1)">1</button></li>`)

        for(var i = 2; i <= tmp; i++){
            var html = `<li class="page-item"><button type="button" class="btn btn-white page-link" onclick="goPage(${i})" index="${i}">${i}</button></li>`
            obj.append(html)
        }

        if(page != tmp){
            obj.append(`<li class="page-item"><button type="button" class="btn btn-white page-link" index="after">></button></li>`)
            obj.find(`[index="after"]`).attr("onclick", `goPage(${page+1})`)
        }

        obj.find(`[index="${page}"]`).addClass("active");
        obj.find(`[index="${page}"]`).removeAttr("onclick");
    }
}

function isNullInput(name){
  var ip = $(`[name="${name}"]`).val().trim()
  if(ip.length == 0){
    $(`.invalid-feedback[for="${name}"]`).addClass("d-block")
    return true
  }else{
    $(`.invalid-feedback[for="${name}"]`).removeClass("d-block")
  }
  return false
}

$(document).ready(function(){
    $('ul[onload]').trigger('onload');
})