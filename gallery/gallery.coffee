gallery = {}

class gallery.Exhibit extends Backbone.Model
    defaults:
        htmlid: 'index'
        url: '../index/index.html'
        width: 560
        height: 700

class gallery.Exhibits extends Backbone.Collection
    model: gallery.Exhibit

class gallery.ExhibitView extends Backbone.View
    initialize:  ->
        console.log "init exhibit"

    render: =>
        #render iframe with url from model
        $(@el).attr("src", @model.get("url"))
        $(@el).attr("width", @model.get("width"))
        $(@el).attr("height", @model.get("height"))


json_url = "advd3.json"
init = () ->
    d3.json(json_url, (data) ->
        exhibits = new gallery.Exhibits(data)
        #exhibits.add( new gallery.Exhibit() )
        #exhibits.add( new gallery.Exhibit() )
        console.log "exhibits", exhibits

        exhibits.each((ex) ->
            id = ex.get("htmlid")
            iframe = $('<iframe id="' + id + '"></iframe>')
            console.log "iframe", iframe
            $('#iframes').append(iframe)


            ev = new gallery.ExhibitView(model: ex, id: id, el: iframe)
            ev.render()
        )

    )

init()
