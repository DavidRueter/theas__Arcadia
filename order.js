import vueOrderApp from {{ 'order_app.vue'|theasResource }}

  //use Axios instead of vue-resource for HTTP calls as per https://medium.com/the-vue-point/retiring-vue-resource-871a82880af4
    Vue.prototype.$http = axios;

    Vue.directive('swipeleft', {
        bind: function (el, binding) {
            if (typeof binding.value === 'function') {

                const mc = new Hammer.Manager(el, {
                    touchAction: 'auto',
                    inputClass: Hammer.SUPPORT_POINTER_EVENTS ? Hammer.PointerEventInput : Hammer.TouchMouseInput,
                    recognizers: [
                        [Hammer.Swipe, {
                            direction: Hammer.DIRECTION_LEFT
                         }]
                     ]
                 });
                mc.on('swipeleft', binding.value);
            }
        }
    });
    
    Vue.directive('swiperight', {
        bind: function (el, binding) {
            if (typeof binding.value === 'function') {

                 const mc = new Hammer.Manager(el, {
                    touchAction: 'auto',
                    inputClass: Hammer.SUPPORT_POINTER_EVENTS ? Hammer.PointerEventInput : Hammer.TouchMouseInput,
                    recognizers: [
                        [Hammer.Swipe, {
                            direction: Hammer.DIRECTION_RIGHT
                         }]
                     ]
                 });
            
                mc.on('swiperight', binding.value);
            }
        }
    });

    if (!FormData.prototype.set) {
        FormData.prototype.set = FormData.prototype.append;
    }


    new Vue({
        delimiters: ["[[", "]]"],
        render: h => h(vueOrderApp),
    }).$mount(`#thapp`);
