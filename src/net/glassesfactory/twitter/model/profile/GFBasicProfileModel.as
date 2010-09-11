/*////////////////////////////////////////////

GFTweet

Autor	YAMAGUCHI EIKICHI
(@glasses_factory)
Date	2010/09/11

Copyright 2010 glasses factory
http://glasses-factory.net

/*////////////////////////////////////////////

package net.glassesfactory.twitter.model.profile
{

	/**-----------------------------------
	 * ベーシックなユーザーモデル
	 * とりあえずこんだけあれば何かできそうな感じ。
	 *----------------------------------*/ 
	public class GFBasicProfileModel implements IGFProfileModel
	{
		
		/**
		 * @return	_name	String	名前;
		 * @param	_name	String	名前;
		 * 名前
		 * セッティングでNameの個所に該当するデータ。
		 */
		public function get name():String{ return _name; }
		public function set name( value:String ):void{ _name = value; }
		protected var _name:String;
		
		
		/**
		 * @return	_username	String	ID名;
		 * @param	_username	String	ID名;
		 * ユーザーネーム。twitter ID。
		 * セッティングでUsernameの個所に該当するデータ。
		 */
		public function get userName():String{ return _userName; }
		public function set userName( value:String ):void{ _userName = value; }
		protected var _userName:String;
		
		
		/**
		 * @return	_url	String	URL
		 * @param	value	String	URL
		 * URL
		 * ユーザー個別表示画面でWebに該当するデータ。
		 */
		public function get url():String{ return _url; }
		public function set url( value:String ):void{ _url = value; }
		protected var _url:String;
		
		
		/**
		 * @return 	_profileIMGURL	String	アイコンURL
		 * @param	value			String	アイコンURL
		 * ユーザーアイコン画像のURL
		 */
		public function get iconURL():String{ return _iconURL; }
		public function set iconURL( value:String ):void{ _iconURL = value; }
		protected var _iconURL:String;
		
		
		
		/*/////////////////////////////////
		* public methods
		/*/////////////////////////////////
		
		//Constractor
		public function GFBasicProfileModel( name:String, userName:String, url:String, iconURL:String )
		{
			_name = name;
			_userName = userName;
			_url = url;
			_iconURL = iconURL;
		}
		
		
		/*/////////////////////////////////
		* private methods
		/*/////////////////////////////////
		
		
		/*/////////////////////////////////
		* private variables
		/*/////////////////////////////////
		
		
	}
}