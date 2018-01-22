var MyUtils = {
  format_json: function (txt, compress) {
    var indentChar = '&nbsp;&nbsp;&nbsp;&nbsp;';
    if (/^\s*$/.test(txt)) {
      //alert('txt is empty');
      return '';
    }
    try {
      var data = eval('(' + txt + ')');
      txt = txt.replace(new RegExp("\"{", "gm"), "{").replace(new RegExp("}\"", "gm"), "}");
      txt = txt.replace(new RegExp("\\\\\\\"", "gm"), "\"");
      txt = txt.replace(new RegExp("\\\\\\\"", "gm"), "\"");
      txt = txt.replace(new RegExp("\\\\\\\"", "gm"), "\"");
      txt = txt.replace(new RegExp("&nbsp;", "gm"), "");
//        console.log(txt);
      data = eval('(' + txt + ')');
    } catch (e) {
      //alert('txt format error: '+e.description,'err');
      return txt;
    }
    ;
    var draw = [], last = false, This = this, line = compress ? ''
      : '<br/>', nodeCount = 0, maxDepth = 0;
    var notify = function (name, value, isLast, indent, formObj) {
      if (indent == 0) {
        //draw.push('<table>');
      }
      nodeCount++;
      for (var i = 0, tab = ''; i < indent; i++)
        tab += indentChar;
      tab = compress ? '' : tab;
      maxDepth = ++indent;
      if (value && value.constructor == Array) {
        draw.push(tab + (formObj ? ('"' + name + '":') : '') + '['
          + line);
        for (var i = 0; i < value.length; i++)
          notify(i, value[i], i == value.length - 1, indent,
            false);
        draw.push(tab + ']' + (isLast ? line : (',' + line)));
      } else if (value && typeof value == 'object') {
        draw.push(tab + (formObj ? ('"' + name + '":') : '') + '{'
          + line);
        var len = 0, i = 0;
        for (var key in value)
          len++;
        for (var key in value)
          notify(key, value[key], ++i == len, indent, true);
        draw.push(tab + '}' + (isLast ? line : (',' + line)));
      } else {
        if (typeof value == 'string')
          value = '"' + value + '"';
        draw.push(tab + (formObj ? ('"' + name + '":') : '')
          + value + (isLast ? '' : ',') + line);
      }
      ;
    };
    var isLast = true, indent = 0;

    notify('', data, isLast, indent, false);
    return draw.join('');
  },
  addIndentBlank: function (indent) {
    indentChar = '&nbsp;&nbsp;&nbsp;&nbsp;';
    var ret = "";
    for (var i = 0; i < indent; i++) {
      ret += indentChar;
    }
    return ret;
  },
  format_str: function (txt) {
    if (/^\s*$/.test(txt)) {
      //alert('txt is empty');
      return '';
    }
    try {
      //var data = eval('(' + txt + ')');
      txt = txt.replace(new RegExp("\"{", "gm"), "{").replace(new RegExp("}\"", "gm"), "}");    // "{->{   }"->}
      txt = txt.replace(new RegExp("\\\\\\\"", "gm"), "\"");    // \"->"
      txt = txt.replace(new RegExp("\\\\\\\"", "gm"), "\"");
      txt = txt.replace(new RegExp("\\\\\\\"", "gm"), "\"");

      txt = txt.replace(new RegExp("\\\\\\\\r", "gm"), "\\r");
      txt = txt.replace(new RegExp("\\\\\\\\n", "gm"), "\\n");
      txt = txt.replace(new RegExp("\\\\\\\\r", "gm"), "\\r");
      txt = txt.replace(new RegExp("\\\\\\\\n", "gm"), "\\n");
      txt = txt.replace(new RegExp("\\\\\\\\r", "gm"), "\\r");
      txt = txt.replace(new RegExp("\\\\\\\\n", "gm"), "\\n");

      //txt = txt.replace(new RegExp("&nbsp;","gm"), "");

      var draw = [];
      var line = "<br/>";
      var indent = 0;
      var quoteCount = 0;
      var quoteOddEven = 0;    // Even count quote(") to deal, Odd is string
      var containLeftBrace = false;
      var preChar = '';
      var nextChar = '';
      for (var i = 0; i < txt.length; i++) {
        current = txt.charAt(i);
        try {
          nextChar = txt.charAt(i + 1);
        } catch (e) {
          console.log(e);
        }
        switch (current) {
          case '{':
            containLeftBrace = true;
          case '[': {
            if (preChar == '\"') {
              draw.push(current);
              break;
            }
            if (quoteOddEven == 0) {
              ++indent;
              draw.push(current);
              draw.push(line);
              draw.push(addIndentBlank(indent));
              break;
            } else {
              draw.push(current);
              break;
            }
          }
          case '}':
          case ']': {
            if (nextChar == '\"') {
              draw.push(current);
              break;
            }
            if (quoteOddEven == 0) {
              --indent;
              draw.push(line);
              draw.push(addIndentBlank(indent));
              draw.push(current);
              break;
            } else {
              draw.push(current);
              break;
            }
          }
          case ',': {
            if (quoteOddEven == 0 && quoteCount > 0 && containLeftBrace) {
              draw.push(current);
              draw.push(line);
              draw.push(addIndentBlank(indent));
              break;
            } else {
              draw.push(current);
              break;
            }
          }
          case '\\': {
            try {
              next1 = txt.charAt(i + 1);
              next2 = txt.charAt(i + 2);
              next3 = txt.charAt(i + 3);
//                         console.log(current + next1 + next2 + next3);
              if ((next1 + "") == "r" && (current + next1 + next2 + next3) == "\\r\\n") {
                draw.push(line);
                draw.push(addIndentBlank(indent + 1));
                i = i + 3;
              }
            } catch (e) {
              console.log(e);
            }
            break;
          }
          case '\"': {
            quoteCount = quoteCount + 1;
            quoteOddEven = (quoteOddEven + 1) % 2;
            draw.push(current);
            break;
          }
          default: {
            draw.push(current);
          }
        }
        preChar = current;
      }

//        console.log('draw: ' + draw.join(''));
    } catch (e) {
//        alert('txt format error: '+e,'err');
      return txt;
    }
    return draw.join('');
  }
}
export default MyUtils
