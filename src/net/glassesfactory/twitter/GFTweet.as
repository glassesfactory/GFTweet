/*////////////////////////////////////////////

GFTweet

Autor	YAMAGUCHI EIKICHI
(@glasses_factory)
Date	2010/09/11

Copyright 2010 glasses factory
http://glasses-factory.net

/*////////////////////////////////////////////

package net.glassesfactory.twitter
{
	import flash.display.Shape;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.external.ExternalInterface;
	
	import net.glassesfactory.twitter.events.GFTweetEvent;
	
	public class GFTweet extends EventDispatcher implements IEventDispatcher
	{
		/*/////////////////////////////////
		* public variables
		/*/////////////////////////////////
		
		/**<p>どっちかっていうとAnywhereの方がまだ仕様が発表されてても未実装な部分が多い。</p>*/
		public static const VERSION:String = "0.5";
		
		
		/*/////////////////////////////////
		* getter
		/*/////////////////////////////////
		
		/**---------------------------------------
		 * @return Boolean
		 * APIが読み込み済みで、
		 * コネクションが確立されているかどうかを返します
		 *---------------------------------------*/
		public static function isAuthed():Boolean
		{
			_isReady = ExternalInterface.call( "gfAnywhere.isAuthed" );
			return _isReady;
		}
		
		
		/*/////////////////////////////////
		* setter
		/*/////////////////////////////////
		
		
		/*/////////////////////////////////
		* public methods
		/*/////////////////////////////////
		
		/**----------------------------------------
		 * コンストラクタ
		 * ExternalInterfaceでjsとやり取りする関係上
		 * 複数生成されたらまずいのでシングルトンにしてあります。
		 *---------------------------------------*/
		public function GFTweet( caller:Function = null )
		{
			if( caller != GFTweet.init )
			{
				throw new Error("GFTweetはまだ初期化されていません。GFTweet.init()を実行してください。");
			}
			if( _instance != null )
			{
				throw new Error("既に初期化されています。GFTweetを複数生成することは出来ません。");
			}
		}
		
		
		/**--------------------------------------------
		 * <p>GFTweetを初期化します。
		 * 初期化が完了したらGFTweetEvent.INITIALIZEを通知します。</p>
		 *--------------------------------------------*/
		public static function init():GFTweet
		{
			if( !ExternalInterface.available ){ throw new Error("GFTweetの実行には、javascriptとやりとりが出来る必要があります。"); }
			if( !( _instance != null ))
			{
				_instance = new GFTweet( arguments.callee );
				//_ticker = new Shape();
				_isReady = false;
				ExternalInterface.addCallback( "apiInitialized", _apiInitialized );
				ExternalInterface.addCallback( "authenticated", _authenticated );
				ExternalInterface.addCallback( "signOuted", _signOuted );
				ExternalInterface.addCallback( "tweeted", _tweetComplete );
				ExternalInterface.addCallback( "tlLoaded", _tlLoaded );
				ExternalInterface.addCallback( "favorited", _fovorited );
				ExternalInterface.addCallback( "unFavorited", _unFavorited );
				ExternalInterface.addCallback( "destroyed", _destroyed );
				ExternalInterface.addCallback( "dmSended", _dmSended );
				ExternalInterface.addCallback( "getMyProfile", _getMyProfile );
				ExternalInterface.addCallback( "getUserProfile", _getUserProfile );
				ExternalInterface.call( "GFTweet.init", ExternalInterface.objectID );
			}
			return _instance;
		}
		
		
		
		
		/*////////////////////////////////////////////////////////////////
		 * 認証など
		/*////////////////////////////////////////////////////////////////
		
		/**--------------------------------------------
		 * <p>twitterとの接続を確立します。
		 * 認証画面が立ち上がり、GFTweetEvent.INITIALIZEを通知します。</p>
		 *--------------------------------------------*/
		public static function signIn():void
		{
			ExternalInterface.call( "gfAnywhere.auth" );
		}
		
		
		/**-------------------------------------------
		 * <p>twitterとの接続を解除します。</p>
		 *-------------------------------------------*/
		public static function signOut():void
		{
			if( !_isReady ){ return; } 
			ExternalInterface.call( "gfAnywhere.signOut" );
		}
		
		
		/*////////////////////////////////////////////////////////////////
		* TL取得系
		/*////////////////////////////////////////////////////////////////
		
		
		/**--------------------------------------------
		 * <p>特定ユーザーの発言を取得します。
		 * @param	username	取得したいユーザーのID
		 * @param	requestNum		一度に取得する発言数 @default	10;
		 * </p>
		 *-------------------------------------------*/
		public static function getUserTL( username:String, requestNum:int = 10 ):void
		{
			if( !_isReady ){ return; }
			ExternalInterface.call( "gfAnywhere.getUserTL", username, requestNum );
		}
		
		
		/**--------------------------------------------
		 * <p>ログインしているユーザーのhome TLを取得します。
		 * @param	requestNum		一度に取得する発言数 @default	10;
		 * </p>
		 *-------------------------------------------*/
		public static function getHomeTL( requestNum:int = 10 ):void
		{
			if( !_isReady ){ return; }
			ExternalInterface.call( "gfAnywhere.currentUserTL", "home", requestNum );
		}
		
		
		/**--------------------------------------------
		 * <p>ログインしているユーザーへのリプライ一覧を取得します。
		 * @param	requestNum		一度に取得するリプライ数 @default	10;
		 * </p>
		 *-------------------------------------------*/
		public static function getMention( requestNum:int = 10 ):void
		{
			if( !_isReady ){ return; } 
			ExternalInterface.call( "gfAnywhere.currentUserTL", "mentions", requestNum );
		}
		
		
		/**--------------------------------------------
		 * <p>ログインしているユーザーへのDirect Message一覧を取得します。
		 * @param	requestNum		一度に取得するメッセージ数 @default	10;
		 * </p>
		 *-------------------------------------------*/
		public static function getDM( requestNum:int = 10 ):void
		{
			if( !_isReady ){ return; }
			ExternalInterface.call( "gfAnywhere.currentUserTL", "dm", requestNum );
		}
		
		public static function getSentDM( requestNum:int = 10 ):void
		{
			if( !_isReady ){ return; }
			ExternalInterface.call( "gfAnywhere.currentUserTL", "sentDM", requestNum );
		}
		
		
		/**--------------------------------------------
		 * <p>ログインしているユーザーの公式Retweetされた発言一覧を取得します。
		 * @param	requestNum	一度に取得する公式RT数 @default	10;
		 * </p>
		 *-------------------------------------------*/
		public static function getUserRT( requestNum:int = 10 ):void
		{
			if( !_isReady ){ return; }
			ExternalInterface.call( "gfAnywhere.currentUserTL", "rt", requestNum );
		}
		
		
		/**--------------------------------------------
		 * <p>ログインしているユーザーが行った公式Retweet一覧を取得します。
		 * @param	requestNum		一度に取得するメッセージ数 @default	10;
		 * </p>
		 *-------------------------------------------*/
		public static function getRTByUser( requestNum:int = 10 ):void
		{
			if( !_isReady ){ return; }
			ExternalInterface.call( "gfAnywhere.currentUserTL", "rtByUser", requestNum );
		}
		
		
		/**--------------------------------------------
		 * <p>ログインしているユーザーのfollwerが行った公式Retweet一覧を取得します。
		 * @param	requestNum		一度に取得するメッセージ数 @default	10;
		 * </p>
		 *-------------------------------------------*/
		public static function getRTByFollower( requestNum:int = 10 ):void
		{
			if( !_isReady ){ return; }
			ExternalInterface.call( "gfAnywhere.currentUserTL", "rtByFollower", requestNum );
		}
		
		
		
		/*////////////////////////////////////////////////////////////////
		* Tweet発言系
		/*////////////////////////////////////////////////////////////////
		
		/**--------------------------------------------
		 * <p>twitterにつぶやきを送信します。
		 * @param	tweet	つぶやくテキスト
		 * </p>
		 *-------------------------------------------*/
		public static function tweet( tweet:String ):void
		{
			if( !_isReady ){ return; }
			ExternalInterface.call( "gfAnywhere.tweet", tweet );
		}
		
		
		/**--------------------------------------------
		 * <p>特定ユーザーにリプライを送信します。
		 * ただし2010/09/11現在 in reply toなどのオプション指定が未実装？
		 * のためコメントアウト。
		 * @param	msg	リプライする内容
		 * @param	statusID	リプライ元のツイートID
		 * </p>
		 *-------------------------------------------
		public static function reply( msg:String, satusID:int ):void
		{
			if( !_isReady ){ return; }
			ExternalInterface.call( "gfAnywhere.reply", msg, satusID );
		}
		*/
		
		/**--------------------------------------------
		 * <p>特定の発言をふぁぼります。
		 * @param	statusID ふぁぼるツイートのID
		 * </p>
		 *-------------------------------------------*/
		public static function fav( statusID:Number ):void
		{
			if( !_isReady ){ return; }
			ExternalInterface.call( "gfAnywhere.addFav", statusID );
		}
		
		
		/**--------------------------------------------
		 * <p>特定の発言のふぁぼりを解除します、
		 * @param	statusID ふぁぼりを解除するツイートのID
		 * </p>
		 *-------------------------------------------*/
		public static function unFav( statusID:Number ):void
		{
			if( !_isReady ){ return; }
			ExternalInterface.call( "gfAnywhere.unFav", statusID );
		}
		
		
		/**--------------------------------------------
		 * <p>特定の発言を削除します。
		 * @param	statusID なかった事にしたいツイートのID
		 * </p>
		 *-------------------------------------------*/
		public static function destroy( statusID:Number ):void
		{
			if( !_isReady ){ return; }
			ExternalInterface.call( "gfAnywhere.destroy", statusID );
		}
		
		
		
		/*////////////////////////////////////////////////////1////////////
		* DM送信
		/*////////////////////////////////////////////////////////////////
		
		/**--------------------------------------------
		 * <p>ダイレクトメッセージを送信します。
		 * @param	msg	メッセージ本文
		 * @param	username	メッセージを送りたい相手のID
		 * </p>
		 *-------------------------------------------*/
		public static function sendDM( msg:String, username:String ):void
		{
			if( !_isReady ){ return; }
			ExternalInterface.call( "gfAnywhere.sendDM", msg, username );	
		}
		
		
		
		/*////////////////////////////////////////////////////1////////////
		* ユーザープロフィール系
		/*////////////////////////////////////////////////////////////////
		
		/**--------------------------------------------
		 * <p>自分自身のプロフィールを取得します。
		 * </p>
		 *-------------------------------------------*/
		public static function getMyProfile():void
		{
			if( !_isReady ){ return; }
			ExternalInterface.call( "gfAnywhere.currentUserProfile" );
		}
		
		
		/**--------------------------------------------
		 * <p>特定ユーザーのプロフィールを取得します。
		 * </p>
		 *-------------------------------------------*/
		public static function getUserProfile( username:String ):void
		{
			if( !_isReady ){ return; }
			ExternalInterface.call( "gfAnywhere.userProfile", username );
		}
		
		public static function addEventListener( type:String, listener:Function, useCapture:Boolean = false, priority:int = 0, useWeakReference:Boolean = false ):void
		{
			_ticker.addEventListener( type, listener, useCapture, priority, useWeakReference );
		}
		
		public static function removeEventListener( type:String, listener:Function, useCapture:Boolean = false ):void
		{
			_ticker.removeEventListener( type, listener, useCapture );
		}
		
		/*/////////////////////////////////
		* private methods
		/*/////////////////////////////////
		
		/**---------------------------------------------
		 * @private _apiInitialized
		 * Anywhere API が読み込まれたら
		 * js側からアクセスされ、API読み込み完了となります。
		 *---------------------------------------------*/
		private static function _apiInitialized():void
		{
			trace("API Initialized");
			_ticker.dispatchEvent( new GFTweetEvent( GFTweetEvent.ANYWHERE_INITIALIZE, null, true ));
		}
		
		
		/**---------------------------------------------
		 * @private _authenticated
		 * twitterとの接続が認証確立されたことを通知します。
		 *---------------------------------------------*/
		private static function _authenticated():void
		{
			_isReady = true;
			_ticker.dispatchEvent( new GFTweetEvent( GFTweetEvent.AUTHENTICATED ));
		}
		
		
		
		/**---------------------------------------------
		 * @private signOuted
		 * twitterとの接続が解除された場合jsからの通知を受け流します。
		 *---------------------------------------------*/
		private static function _signOuted():void
		{
			_isReady = false;
			_ticker.dispatchEvent( new GFTweetEvent( GFTweetEvent.SIGN_OUTED ));
		}
		
		/*////////////////////////////////////////////////////////////////
		* @private TL取得
		/*////////////////////////////////////////////////////////////////
		
		private static function _tlLoaded( result:* ):void
		{
			_ticker.dispatchEvent( new GFTweetEvent( GFTweetEvent.TIMELINE_LOADED, result ));
		}
		
		/*////////////////////////////////////////////////////////////////
		* @private Tweet投稿
		/*////////////////////////////////////////////////////////////////
		
		/**----------------------------------------------
		 * tweetしたことを通知します。
		 *----------------------------------------------*/ 
		private static function _tweetComplete():void
		{
			_ticker.dispatchEvent( new GFTweetEvent( GFTweetEvent.TWEET_COMPLETE ));
		}
		
		
		/**----------------------------------------------
		 * ふぁぼれたことを通知します。
		 *----------------------------------------------*/
		private static function _fovorited():void
		{
			_ticker.dispatchEvent( new GFTweetEvent( GFTweetEvent.FAVORITE_COMPLETE ));
		}
		
		
		/**----------------------------------------------
		 * ふぁぼりを解除したことを通知します。
		 *----------------------------------------------*/
		private static function _unFavorited():void
		{
			_ticker.dispatchEvent( new GFTweetEvent( GFTweetEvent.UN_FOVORITE_COMPLETE ));
		}
		
		
		/**----------------------------------------------
		 * tweetの破棄に成功したことを通知します。
		 *----------------------------------------------*/
		private static function _destroyed():void
		{
			_ticker.dispatchEvent( new GFTweetEvent( GFTweetEvent.DESTROY_COMPLETE ));
		}
		
		
		
		/*////////////////////////////////////////////////////////////////
		* @private DM送信
		/*////////////////////////////////////////////////////////////////
		
		/**----------------------------------------------
		 * DMの送信に成功したことを通知します。
		 *----------------------------------------------*/
		private static function _dmSended():void
		{
			_ticker.dispatchEvent( new GFTweetEvent( GFTweetEvent.DIRECT_MESSAGE_SENDED ));
		}
				
		
		
		/*////////////////////////////////////////////////////////////////
		* @private プロフィール取得
		/*////////////////////////////////////////////////////////////////
		
		/**----------------------------------------------
		 * 自身のプロフィール取得が完了したことを通知します。
		 *----------------------------------------------*/
		private static function _getMyProfile( profile:* ):void
		{
			_ticker.dispatchEvent( new GFTweetEvent( GFTweetEvent.GET_MYPROFILE, profile ));
		}
		
		
		/**----------------------------------------------
		 * 特定ユーザーのプロフィール取得が完了したことを通知します。
		 *----------------------------------------------*/
		private static function _getUserProfile( profile:* ):void
		{
			_ticker.dispatchEvent( new GFTweetEvent( GFTweetEvent.GET_USERPROFILE, profile ));
		}
		
		
		/*/////////////////////////////////
		* private variables
		/*/////////////////////////////////
		
		private static var _instance:GFTweet;
		
		private static var _anywhere:String;
		
		//イベントディスパッチ用
		private static var _ticker:Shape = new Shape();
		
		private static var _isReady:Boolean;
	}
}