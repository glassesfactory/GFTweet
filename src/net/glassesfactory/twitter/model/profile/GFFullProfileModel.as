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
	 * ユーザーモデル
	 * ほぼ全てのプロフィール項目を記載。
	 * かっちりしたクライアントとか作るとき向け。
	 *----------------------------------*/
	public class GFFullProfileModel extends GFBasicProfileModel
	{
		/**
		 * @return _id	Number	twitter内部ID
		 * twitter内部でのID番号。
		 */
		public function get id():Number{ return _id; }
		private var _id:Number;
		
		
		/**
		 * @return	_description	String	自己紹介
		 * @param	_description	String	自己紹介
		 * 自己紹介。
		 * ユーザー個別表示画面でBioに該当するデータ。
		 */
		public function get description():String{ return _description; }
		public function set description( value:String):void{ _description = value; }
		private var _description:String;
		
		
		/**
		 * @return	_location	String	ロケーション
		 * @param	value 		String	ロケーション
		 * ロケーション
		 * ユーザー個別表示画面でlocationに該当するデータ。
		 */
		public function get location():String{ return _location; }
		public function set location( value:String ):void{ _location = value; }
		private var _location:String;
		
		
		/**
		 * @return 	_following	uint	フォロー数
		 * @param	value		uint	フォロー数
		 * ユーザーがフォローしている数。
		 */
		public function get following():uint{ return _following; }
		public function set following( value:uint ):void{ _following = value; }
		private var _following:uint;
		
		
		/**
		 * @return 	_follower	uint	フォローされている数
		 * @param	value		uint	フォローされている数
		 * ユーザーがフォローされている数。
		 */
		public function get follower():uint{ return _follower; }
		public function set follower( value:uint ):void{ _follower = value; }
		private var _follower:uint;
		
		
		/**
		 * @return 	_statusCount	uint	ツイート数
		 * @param	value			uint	ツイート数
		 * ユーザーのつぶやいた数
		 */
		public function get statusCount():uint{ return _statusCount; }
		public function set statusCount( value:uint ):void{ _statusCount = value; }
		private var _statusCount:uint;
		
		
		/**
		 * @return 	_isFollow	Boolean	対象ユーザーをフォローしているかどうか
		 * @param	value		Boolean	対象ユーザーをフォローしているかどうか
		 * 対象ユーザーをフォローしているかどうか
		 */
		public function get isFollow():Boolean{ return _isFollow; }
		public function set isFollow( value:Boolean ):void{ _isFollow = value; }
		private var _isFollow:Boolean;
		
		
		/*/////////////////////////////////
		* public methods
		/*/////////////////////////////////
		
		//Constractor
		public function GFFullProfileModel(name:String, username:String, url:String, profileIMGURL:String,
										   id:Number, description:String, location:String, 
											following:uint, follower:uint,
											statusCount:uint, isFollow:Boolean )
		{
			
			super( name, username, url, profileIMGURL );
			_id = id;
			_description = description;
			_location = location;
			_following = following;
			_follower = follower;
			_statusCount = statusCount;
			_isFollow = isFollow;
		}
	}
}