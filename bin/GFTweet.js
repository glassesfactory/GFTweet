var GFTweet=window.GFTweet=function(a){this.swfID=a;twttr.anywhere(this._anywhereLoaded)};
GFTweet.prototype={_anywhereLoaded:function(a){tObj=a;GFTweet.fl2Dispatch(GFTweet.swfName(gfAnywhere.swfID),"apiInitialized")},auth:function(){if(!tObj.isConnected()){tObj.bind("authComplete",function(){GFTweet.fl2Dispatch(GFTweet.swfName(gfAnywhere.swfID),"authenticated")});tObj.signIn()}},signOut:function(){if(tObj.isConnected()){tObj.bind("signOut",function(){GFTweet.fl2Dispatch(GFTweet.swfName(gfAnywhere.swfID),"signOuted")});twttr.anywhere.signOut()}},isAuthed:function(){return tObj.isConnected()},
getUserTL:function(a,b){var c=[];tObj.User.find(a).timeline({count:b,success:function(){GFTweet.fl2Dispatch(GFTweet.swfName(gfAnywhere.swfID),"tlLoaded",[c])},error:GFTweet.throwError}).each(function(d){c.push(d)})},currentUserTL:function(a,b){var c=[],d;switch(a){case "home":d="homeTimeline";break;case "mentions":d="mentions";break;case "dm":d="directMessages";break;case "sentDM":d="sentMessages";break;case "rt":d="retweeted";break;case "rtByUser":funcNme="retweeting";break;case "rtByFollower":d=
"retweets"}tObj.currentUser[d]({count:b,success:function(){GFTweet.fl2Dispatch(GFTweet.swfName(gfAnywhere.swfID),"tlLoaded",[c])},error:GFTweet.throwError}).each(function(e){c.push(e)})},tweet:function(a){tObj.Status.update(a,{success:function(){GFTweet.fl2Dispatch(GFTweet.swfName(gfAnywhere.swfID),"tweeted")},error:GFTweet.throwError})},reply:function(a,b){tObj.Status.reply(a,{in_reply_to_status_id:b,success:function(){GFTweet.fl2Dispatch(GFTweet.swfName(gfAnywhere.swfID),"tweeted")},error:GFTweet.throwError})},
addFav:function(a){alert(typeof a);tObj.Status.favorite(a,{success:function(){GFTweet.fl2Dispatch(GFTweet.swfName(gfAnywhere.swfID),"favorited")}})},unFav:function(a){tObj.Status.unfavorite(a,{success:function(){GFTweet.fl2Dispatch(GFTweet.swfName(gfAnywhere.swfID),"unFavorited")},error:GFTweet.throwError})},destroy:function(a){tObj.Status.find(a).destroy({success:function(){GFTweet.fl2Dispatch(GFTweet.swfName(gfAnywhere.swfID),"destroyed")},error:GFTweet.throwError})},sendDM:function(a,b){tObj.DirectMessage.send(b,
a,{success:function(){GFTweet.fl2Dispatch(GFTweet.swfName(gfAnywhere.swfID),"dmSended")},error:GFTweet.throwError})},currentUserProfile:function(){var a;tObj.currentUser.homeTimeline({count:1,success:function(){a=tObj.currentUser;GFTweet.fl2Dispatch(GFTweet.swfName(gfAnywhere.swfID),"getMyProfile",[a])},error:GFTweet.throwError})},userProfile:function(a){var b=[];tObj.User.find(a).timeline({count:1,success:function(){b=b[0].user;GFTweet.fl2Dispatch(GFTweet.swfName(gfAnywhere.swfID),"getUserProfile",
[b])},error:GFTweet.throwError}).each(function(c){b.push(c)})},follow:function(a){tObj.User.find(a).follow({success:function(){GFTweet.fl2Dispatch(GFTweet.swfName(gfAnywhere.swfID),"follow")},error:GFTweet.throwError})},remove:function(a){tObj.User.find(a).unfollow({success:function(){GFTweet.fl2Dispatch(GFTweet.swfName(gfAnywhere.swfID),"unfollow")},error:GFTweet.throwError})},block:function(a){tObj.User.find(a).block({success:function(){GFTweet.fl2Dispatch(GFTweet.swfName(gfAnywhere.swfID),"block")},
error:GFTweet.throwError})},unBlock:function(a){tObj.User.find(a).unblock({success:function(){GFTweet.fl2Dispatch(GFTweet.swfName(gfAnywhere.swfID),"unblock")},error:GFTweet.throwError})},spamReport:function(a){tObj.User.find(a).report({success:function(){GFTweet.fl2Dispatch(GFTweet.swfName(gfAnywhere.swfID),"spamReport")},error:GFTweet.throwError})},isFollowing:function(a){var b;tObj.currentUser.isFollowing(a,{success:function(c){b=c;GFTweet.fl2Dispatch(GFTweet.swfName(gfAnywhere.swfID),"getRelationship",
b)},error:GFTweet.throwError})},isFollowedBy:function(a){var b;tObj.currentUser.isFollowedBy(a,{success:function(c){b=c;GFTweet.fl2Dispatch(GFTweet.swfName(gfAnywhere.swfID),"getRelationship",b)},error:GFTweet.throwError})}};GFTweet.swfName=function(a){return navigator.appName.indexOf("Microsoft")!=-1?window[a]:document[a]};GFTweet.throwError=function(a){GFTweet.fl2Dispatch(GFTweet.swfName(gfAnywhere.swfID),"throwError",a)};
GFTweet.fl2Dispatch=function(a,b,c){if(a&&typeof a[b]=="function")switch(c?c.length:0){case 0:return a[b]();case 1:return a[b](c[0]);case 2:return a[b](c[0],c[1]);case 3:return a[b](c[0],c[1],c[2]);case 4:return a[b](c[1],c[1],c[2],c[3]);default:throw"argument too many";}};var gfAnywhere,tObj;GFTweet.init=function(a){gfAnywhere=new GFTweet(a)};