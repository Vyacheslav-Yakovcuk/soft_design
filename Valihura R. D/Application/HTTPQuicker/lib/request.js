var request = {
    method: 'GET',
    url: null,
    headers : [],
    body: null,

    addHeader: function(name, value) {
      this.headers.push({
         name: name,
         value: value
      });
    },

    setBody: function(body) {
        this.body = body;
      this.addHeader("Content-length", body.length);
    },

    send: function(action){
        var http = new XMLHttpRequest()

        if(this.method === 'GET' && this.body != '') {
            var query = JSON.parse(this.body);

            var str = Object.keys(query).map(function(key){
              return encodeURIComponent(key) + '=' + encodeURIComponent(query[key]);
            }).join('&');

            this.url += ((this.url.search(/\?/g) == -1) ? "?": "&") +str;
        }

        http.open(this.method, this.url, true);

        this.headers.forEach(function(header, index, array){
            http.setRequestHeader(header.name, header.value);
        });

        http.onreadystatechange = function() {
            if(http.readyState == 4){
                if(http.status == 200) {
                    action(http.responseText.toString(), true);
                }else{
                    action("Cannot connect", false);
                }
            }
        }
        http.send(this.body);
    }
}
