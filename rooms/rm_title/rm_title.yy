{
  "resourceType": "GMRoom",
  "resourceVersion": "1.0",
  "name": "rm_title",
  "creationCodeFile": "rooms/rm_title/RoomCreationCode.gml",
  "inheritCode": false,
  "inheritCreationOrder": true,
  "inheritLayers": true,
  "instanceCreationOrder": [
    {"name":"inst_3C648290","path":"rooms/rm_title/rm_title.yy",},
    {"name":"inst_A892AE7","path":"rooms/rm_title/rm_title.yy",},
    {"name":"inst_5575928B","path":"rooms/rm_title/rm_title.yy",},
  ],
  "isDnd": false,
  "layers": [
    {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"Controllers","depth":0,"effectEnabled":true,"effectType":null,"gridX":16,"gridY":16,"hierarchyFrozen":false,"inheritLayerDepth":true,"inheritLayerSettings":true,"inheritSubLayers":true,"inheritVisibility":true,"instances":[
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_A892AE7","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":true,"isDnd":false,"objectId":null,"properties":[],"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":64.0,"y":0.0,},
      ],"layers":[],"properties":[],"userdefinedDepth":false,"visible":true,},
    {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"Special","depth":100,"effectEnabled":true,"effectType":null,"gridX":16,"gridY":16,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":true,"inheritSubLayers":true,"inheritVisibility":true,"instances":[],"layers":[],"properties":[],"userdefinedDepth":false,"visible":true,},
    {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"Instances_Above","depth":200,"effectEnabled":true,"effectType":null,"gridX":16,"gridY":16,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":true,"inheritSubLayers":true,"inheritVisibility":true,"instances":[],"layers":[],"properties":[],"userdefinedDepth":false,"visible":true,},
    {"resourceType":"GMRAssetLayer","resourceVersion":"1.0","name":"UI_Above","assets":[
        {"resourceType":"GMRSpriteGraphic","resourceVersion":"1.0","name":"graphic_55DA5E5C","animationSpeed":1.0,"colour":4294967295,"frozen":false,"headPosition":0.0,"ignore":false,"inheritedItemId":null,"inheritItemSettings":false,"rotation":0.0,"scaleX":0.5,"scaleY":0.5,"spriteId":{"name":"spr_logo","path":"sprites/spr_logo/spr_logo.yy",},"x":320.0,"y":-16.0,},
      ],"depth":300,"effectEnabled":true,"effectType":null,"gridX":16,"gridY":16,"hierarchyFrozen":false,"inheritLayerDepth":true,"inheritLayerSettings":true,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[],"userdefinedDepth":false,"visible":true,},
    {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"Stats","depth":400,"effectEnabled":true,"effectType":null,"gridX":16,"gridY":16,"hierarchyFrozen":false,"inheritLayerDepth":true,"inheritLayerSettings":true,"inheritSubLayers":true,"inheritVisibility":true,"instances":[],"layers":[],"properties":[],"userdefinedDepth":false,"visible":true,},
    {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"Instances_Mid","depth":500,"effectEnabled":true,"effectType":null,"gridX":16,"gridY":16,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"instances":[
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_5575928B","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"obj_helpbox_controller","path":"objects/obj_helpbox_controller/obj_helpbox_controller.yy",},"properties":[],"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":32.0,"y":112.0,},
      ],"layers":[],"properties":[],"userdefinedDepth":false,"visible":true,},
    {"resourceType":"GMRAssetLayer","resourceVersion":"1.0","name":"UI_Mid","assets":[],"depth":600,"effectEnabled":true,"effectType":null,"gridX":16,"gridY":16,"hierarchyFrozen":false,"inheritLayerDepth":true,"inheritLayerSettings":true,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[],"userdefinedDepth":false,"visible":true,},
    {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"Instances_Below","depth":700,"effectEnabled":true,"effectType":null,"gridX":16,"gridY":16,"hierarchyFrozen":false,"inheritLayerDepth":true,"inheritLayerSettings":true,"inheritSubLayers":true,"inheritVisibility":true,"instances":[
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_3C648290","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"obj_title_menu_controller","path":"objects/obj_title_menu_controller/obj_title_menu_controller.yy",},"properties":[],"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":0.0,"y":0.0,},
      ],"layers":[],"properties":[],"userdefinedDepth":false,"visible":true,},
    {"resourceType":"GMRAssetLayer","resourceVersion":"1.0","name":"UI_Below","assets":[
        {"resourceType":"GMRSpriteGraphic","resourceVersion":"1.0","name":"graphic_621031DB","animationSpeed":1.0,"colour":4294967295,"frozen":false,"headPosition":0.0,"ignore":false,"inheritedItemId":null,"inheritItemSettings":false,"rotation":0.0,"scaleX":1.1551374,"scaleY":1.1551374,"spriteId":{"name":"spr_room_title","path":"sprites/spr_room_title/spr_room_title.yy",},"x":-80.0,"y":-55.0,},
      ],"depth":800,"effectEnabled":true,"effectType":"_effect_glow","gridX":16,"gridY":16,"hierarchyFrozen":false,"inheritLayerDepth":true,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[
        {"name":"g_GlowRadius","type":0,"value":"285",},
        {"name":"g_GlowQuality","type":0,"value":"6.03",},
        {"name":"g_GlowIntensity","type":0,"value":"0.05",},
        {"name":"g_GlowGamma","type":0,"value":"1.85",},
        {"name":"g_GlowAlpha","type":0,"value":"1",},
      ],"userdefinedDepth":false,"visible":true,},
    {"resourceType":"GMRBackgroundLayer","resourceVersion":"1.0","name":"Background","animationFPS":0.0,"animationSpeedType":0,"colour":4278190080,"depth":900,"effectEnabled":true,"effectType":"_effect_glow","gridX":16,"gridY":16,"hierarchyFrozen":false,"hspeed":0.0,"htiled":false,"inheritLayerDepth":true,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[
        {"name":"g_GlowRadius","type":0,"value":"256",},
        {"name":"g_GlowQuality","type":0,"value":"5",},
        {"name":"g_GlowIntensity","type":0,"value":"0.125",},
        {"name":"g_GlowGamma","type":0,"value":"0",},
        {"name":"g_GlowAlpha","type":0,"value":"1",},
      ],"spriteId":null,"stretch":false,"userdefinedAnimFPS":false,"userdefinedDepth":false,"visible":true,"vspeed":0.0,"vtiled":false,"x":0,"y":0,},
  ],
  "parent": {
    "name": "Rooms",
    "path": "folders/Rooms.yy",
  },
  "parentRoom": {
    "name": "rm_template",
    "path": "rooms/rm_template/rm_template.yy",
  },
  "physicsSettings": {
    "inheritPhysicsSettings": true,
    "PhysicsWorld": false,
    "PhysicsWorldGravityX": 0.0,
    "PhysicsWorldGravityY": 10.0,
    "PhysicsWorldPixToMetres": 0.1,
  },
  "roomSettings": {
    "Height": 360,
    "inheritRoomSettings": true,
    "persistent": false,
    "Width": 640,
  },
  "sequenceId": null,
  "views": [
    {"hborder":32,"hport":360,"hspeed":-1,"hview":360,"inherit":true,"objectId":null,"vborder":32,"visible":true,"vspeed":-1,"wport":640,"wview":640,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":true,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1366,"wview":1366,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":true,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1366,"wview":1366,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":true,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1366,"wview":1366,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":true,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1366,"wview":1366,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":true,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1366,"wview":1366,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":true,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1366,"wview":1366,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":true,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1366,"wview":1366,"xport":0,"xview":0,"yport":0,"yview":0,},
  ],
  "viewSettings": {
    "clearDisplayBuffer": true,
    "clearViewBackground": false,
    "enableViews": false,
    "inheritViewSettings": true,
  },
  "volume": 1.0,
}