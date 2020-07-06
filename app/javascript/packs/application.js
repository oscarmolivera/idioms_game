    require("@rails/ujs").start()
    require("turbolinks").start()
    require("@rails/activestorage").start()
    require("channels")
    require("packs/nested_form")
    
    import 'bootstrap';
    import './stylesheets/application.scss';
    global.$ = jQuery;

    const toastr = require("toastr");
    window.toastr = toastr;