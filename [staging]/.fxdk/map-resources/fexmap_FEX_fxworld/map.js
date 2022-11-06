// AUTOMATICALLY GENERATED FILE
// ANY CHANGES TO THIS FILE WILL BE OVERWRITTEN
//
// Compiled at 2022-11-06T14.16.59
setTimeout(EnableEditorRuntime, 0);
on('onResourceStop', (name) => { if (name === GetCurrentResourceName()) DisableEditorRuntime(); });
// Map patches
function applyPatch(md,_e,u){const e=GetEntityIndexFromMapdata(md,_e);if(e===-1)return console.error('Failed to get entity index from mapdata',{mapdataHash:_md,mapdataIndex:md,entityHash:_e});UpdateMapdataEntity(md,e,u)}
const
mp1977164226__32548950={position:[58.5952033996582,-460.505859375,70.90672302246094],matrix:[-0.9976887106895447,0.06795062869787216,0,0,-0.06795062869787216,-0.9976887106895447,0,0,0,0,1,0,58.5952033996582,-460.505859375,70.90672302246094,1]};
on('mapDataLoaded',(md)=>{switch(md){
case 1977164226:{
const m=GetMapdataFromHashKey(md);
applyPatch(m,-32548950,mp1977164226__32548950)
break}
}})