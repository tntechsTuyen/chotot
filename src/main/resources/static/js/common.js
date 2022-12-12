
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
