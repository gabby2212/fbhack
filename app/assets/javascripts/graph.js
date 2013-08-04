  // $(loadCy = function(){

  //   options = {
  //     showOverlay: false,
  //     minZoom: 0.5,
  //     maxZoom: 2,

  //     style: cytoscape.stylesheet()
  //     .selector('node')
  //     .css({
  //       'content': 'data(name)',
  //       'font-family': 'helvetica',
  //       'font-size': 14,
  //       'text-outline-width': 3,
  //       'text-outline-color': '#888',
  //       'text-valign': 'center',
  //       'color': '#fff',
  //       'width': 'mapData(weight, 30, 80, 20, 50)',
  //       'height': 'mapData(height, 0, 200, 10, 45)',
  //       'border-color': '#fff'
  //     })
  //     .selector(':selected')
  //     .css({
  //       'background-color': '#000',
  //       'line-color': '#000',
  //       'target-arrow-color': '#000',
  //       'text-outline-color': '#000'
  //     })
  //     .selector('edge')
  //     .css({
  //       'content': 'data(amount)',
  //       'width': 2,
  //       'target-arrow-shape': 'triangle'
  //     })
  //     ,

  //     elements: el,

  //     // elements: ,

  //     ready: function(){
  //       cy = this;
  //     }
  //   };

  //   $('#cy').cytoscape(options);

  // });

  // var el = {
  // nodes: [
  // {
  //   data: { id: 'j', name: 'josh', weight: 100, height: 200 }
  //   },

  //   {
  //     data: { id: 'm', name: 'mirai', weight: 100, height: 200 }
  //     },

  //     {
  //       data: { id: 'h', name: 'howard', weight: 100, height: 200 }
  //       },

  //       {
  //         data: { id: 'g', name: 'gaby', weight: 100, height: 200 }
  //         },
  //         {
  //           data: { id: 'z', name: 'ziyue', weight: 100, height: 200 }
  //           },
  //           {
  //             data: { id: 'l', name: 'lucas', weight: 100, height: 200 }
  //           }

  //           ],

  //           edges: [
  //           { data: { source: 'j', target: 'm' , amount: '5'} },
  //           { data: { source: 'j', target: 'h' , amount: '10'} },
  //           { data: { source: 'j', target: 'g' , amount: '15'} },

  //           { data: { source: 'z', target: 'l' , amount: '20'} },
  //           { data: { source: 'g', target: 'h' , amount: '30'} },

  //           { data: { source: 'm', target: 'j' ,amount: '20'}},
  //           { data: { source: 'm', target: 'z' , amount: '30'}},
            

  //           { data: { source: 'g', target: 'j' , amount: '40'}}
  //           ],
  //         }