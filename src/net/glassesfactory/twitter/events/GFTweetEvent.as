/*////////////////////////////////////////////

GFAnywhereTweet

Autor	YAMAGUCHI EIKICHI
(@glasses_factory)
Date	2010/09/07

Copyright 2010 glasses factory
http://glasses-factory.net

/*////////////////////////////////////////////

package net.glassesfactory.twitter.events
{
	import flash.events.Event;
	
	public class GFTweetEvent extends Event
	{
		/*/////////////////////////////////
		* public variables
		/*/////////////////////////////////
		
		/**--------------------------------------------
		 * <p>API読み込みが完了したことを通知します。</p>
		 *--------------------------------------------*/
		public static const ANYWHERE_INITIALIZE:String = "anywhere_initialize";
		
		
		/**--------------------------------------------
		 * <p>twitterとのコネクションが確率したことを通知します。</p>
		 *--------------------------------------------*/
		public static const AUTHENTICATED:String ="authenticated";
		
		
		/**--------------------------------------------
		 * <p>GFTeetのセットアップが完了したことを通知します。</p>
		 *--------------------------------------------*/
		public static const INITIALIZED:String = "initialized";
		
		
		/**--------------------------------------------
		 * <p>twitterからサインアウトしたことを通知します。</p>
		 *--------------------------------------------*/
		public static const SIGN_OUTED:String = "sign_outed";
		
		
		/**--------------------------------------------
		 * <p>TLの取得が完了したことを通知します。</p>
		 *--------------------------------------------*/
		public static const TIMELINE_LOADED:String = "timeline_loaded";
		
		
		/**--------------------------------------------
		 * <p>つぶやきが完了したことを通知します。</p>
		 *--------------------------------------------*/
		public static const TWEET_COMPLETE:String = "tweet_complete";
		
		
		/**--------------------------------------------
		 * <p>ふぁぼりが完了したことを通知します。</p>
		 *--------------------------------------------*/
		public static const FAVORITE_COMPLETE:String =  "favorite_complete";
		
		
		/**--------------------------------------------
		 * <p>ふぁぼり解除が完了したことを通知します。</p>
		 *--------------------------------------------*/
		public static const UN_FOVORITE_COMPLETE:String = "un_fovorite_complete";
		
		
		/**--------------------------------------------
		 * <p>発言破棄が完了したことを通知します。</p>
		 *--------------------------------------------*/
		public static const DESTROY_COMPLETE:String = "destroy_complete";
		
		
		/**--------------------------------------------
		 * <p>発言破棄が完了したことを通知します。</p>
		 *--------------------------------------------*/
		public static const DIRECT_MESSAGE_SENDED:String = "direct_message_sended";
		
		
		/**--------------------------------------------
		 * <p>自身のプロフィール取得が完了したことを通知します。</p>
		 *--------------------------------------------*/
		public static const GET_MYPROFILE:String = "get_myprofile";
		
		
		/**--------------------------------------------
		 * <p>特定ユーザーのプロフィール取得が完了したことを通知します。</p>
		 *--------------------------------------------*/
		public static const GET_USERPROFILE:String = "get_userprofile";
		
		
		public function get result():*
		{
			return _result;
		}
		
		
		/*/////////////////////////////////
		* public methods
		/*/////////////////////////////////
		
		//Constractor
		public function GFTweetEvent(type:String, result:* = null, bubbles:Boolean=false, cancelable:Boolean=false )
		{
			super(type, bubbles, cancelable);
			_result = result;
		}
		
		
		/*/////////////////////////////////
		* private methods
		/*/////////////////////////////////
		
		
		/*/////////////////////////////////
		* private variables
		/*/////////////////////////////////
		
		
		/**--------------------------------------------
		 * <p>twitterへのリクエストから得られたデータ</p>
		 *--------------------------------------------*/
		private var _result:*;
		
	}
}