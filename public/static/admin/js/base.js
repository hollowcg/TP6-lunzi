/**
 * 弹窗
 * @param title
 * @param content
 * @param area
 * @param end
 */
function add(title,content,area,end) {
    if (area == '' || area == undefined) {
        area = ['500px', '600px']
    }
    layer.open({
        type: 2
        ,title: title
        ,skin:'layui-layer-admin'
        ,content: content
        ,area: area
        ,end
    });
}

/**
 * 数组指定元素删除
 * @param val
 */
Array.prototype.remove = function(val) {
    var index = this.indexOf(val);
    if (index > -1) {
        this.splice(index, 1);
    }
};