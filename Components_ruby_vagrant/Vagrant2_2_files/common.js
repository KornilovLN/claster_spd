$(document).ready(function() {

    /*
     * Поиск по блогу в шапке сайта
     */
    $('#top-search > form > input[name="query"]').attr('autocomplete', 'off').keyup(function () {
        if ($(this).val().trim().length > 1) {
            $('#top-search > div').html('<div class="top-search-loader"></div>');
            $('#top-search > div > div').show();
            $('#top-search > form').ajaxSubmit({
                target: '#top-search > div > div',
                success: function() {
                    $('#top-search > div > div').removeClass('top-search-loader');
                    if($('#top-search > div > div').is(':empty')) {
                        $('#top-search > div').empty();
                    }
                }
            });
        } else {
            $('#top-search > div').empty();
        }
    });
    $('#top-search > div').on('click', 'div > span', function() {
        $('#top-search > form > input[name="query"]').val('');
        $('#top-search > div').empty();
    });
    
    /*
     * Копирование кода в буфер обмена
     */
    $('<span>')
        .text('Копировать')
        .addClass('copy')
        .appendTo('#content pre');
    $('span.copy').on('click', function () {
        $(this).text('');
        var text = $(this).parent().text();
        if ($(this).parent().hasClass('lang-cli')) {
            text = text.replace(/^[^$>#].*$/gm, '');
            text = text.replace(/^[$>#] /gm, '').replace(/ \\r?\n */g, ' ');
            text = text.trim();
        }
        // console.log(text);
        
        var $tmp = $('<textarea>').appendTo('body');
        $tmp.val(text).select();
        document.execCommand('copy');
        $tmp.remove();
        $(this).text('Копировать');
        $(this).slideUp(200, function () {
            $(this).text('Код в буфере').slideDown(200, function () {
                $(this).delay(1500).slideUp(200, function () {
                    $(this).text('Копировать').slideDown(200);
                });
            });
        });
    });

});
