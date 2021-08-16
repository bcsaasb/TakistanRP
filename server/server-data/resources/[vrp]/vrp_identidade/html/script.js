function addGaps(nStr) {
    nStr += '';
    var x = nStr.split('.');
    var x1 = x[0];
    var x2 = x.length > 1 ? '.' + x[1] : '';
    var rgx = /(\d+)(\d{3})/;
    while (rgx.test(x1)) {
        x1 = x1.replace(rgx, '$1' + '<span style="margin-left: 3px; margin-right: 3px;"/>' + '$2');
    }
    return x1 + x2;
}

function addCommas(nStr) {
    nStr += '';
    var x = nStr.split('.');
    var x1 = x[0];
    var x2 = x.length > 1 ? '.' + x[1] : '';
    var rgx = /(\d+)(\d{3})/;
    while (rgx.test(x1)) {
        x1 = x1.replace(rgx, '$1' + ',<span style="margin-left: 0px; margin-right: 1px;"/>' + '$2');
    }
    return x1 + x2;
}

$(document).ready(function() {


    function addZero(i) {
        if (i < 10) {
            i = "0" + i;
        }
        return i;
    }




    // Partial Functions
    function closeMain() {
        $("#ui").css("display", "none");
    }

    function openMain() {
        $("#ui").css("display", "block");
    }

    function closeAll() {
        $(".body").css("display", "none");
    }

    function openContainer() {
        $(".idade-container").css("display", "block");
    }

    function closeContainer() {
        $(".idade-container").css("display", "none");
    }
    // Listen for NUI Events
    window.addEventListener('message', function(event) {
        var item = event.data;
        // Update HUD Balance
        if (item.updateBalance == true) {

            if (event.data.rotatxt == "parou") {
                $('#TextoHUD').html('<br><span>Pressione </span><span style="color: chartreuse;">E</span> <p><span>para chamar o Mecânico de plantão</span><br></br>');
            } else if (event.data.rotatxt == "defeito") {
                $('#TextoHUD').html('<br><span>Atenção!</span><p><span>Motor com defeito!</span><br><span>procure um mêcanico</span></br>');

            } else if (event.data.rotatxt == "emRota") {
                $('#TextoHUD').html('<br><span>Atenç222ão!</span><p><span>Motor com defeito!</span><br><span>procure um mêcanico</span></br>');

            }

            $('#nome').html(event.data.primeiroNome + " " + event.data.nome);
            $('#id').html(event.data.id);
            $('#registro').html(event.data.registro);
            $('#idade').html(event.data.idade);
            $('#emprego').html(event.data.trabalho);
            $('#telefone').html(event.data.telefone);
            $('#paypal').html("R$" + event.data.paypal);
            $('#carteira').html("R$" + event.data.carteira);
            $('#banco').html("R$" + event.data.banco);
            $('#multas').html("R$" + event.data.multas);


        }
        if (item.meterActive == true) {
            $('#hired').addClass("active").removeClass("notactive");
            $('#timeoff').removeClass("active").addClass("notactive");
        }
        if (item.meterActive == false) {
            $('#hired').removeClass("active").addClass("notactive");;
            $('#timeoff').addClass("active").removeClass("notactive");
        }
        // Open & Close main window
        if (item.openMeter == true) {
            openMain();

        }
        if (item.openMeter == false) {

            closeMain();

        }
        // Open sub-windows / partials
    });
    // On 'Esc' call close method
    document.onkeyup = function(data) {
        if (data.which == 27) {
            $.post('http://vrp_idade/close', JSON.stringify({}));
        }
    };



});