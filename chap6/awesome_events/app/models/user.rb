class User < ActiveRecord::Base
    before_destroy :check_all_events_finished

    # dependent: nullify で、削除対象に関連づくオブジェクトから見た、関連先はnullにセットされる
    # http://railsguides.jp/association_basics.html#dependent
    has_many :created_events, class_name: 'Event', foreign_key: :owner_id, dependent: :nullify
    has_many :tickets, dependent: :nullify

    # participating_eventsというリレーションを作成する。
    # eventモデルを元とし、ticketsに対する結合になる。
    # ここでいうと、関連するticketsに対するeventってことかな？
    # http://railsguides.jp/association_basics.html#has-many-through%E9%96%A2%E9%80%A3%E4%BB%98%E3%81%91
    has_many :participating_events, through: :tickets, source: :event

    def self.find_or_create_from_auth_hash(auth_hash)
        provider = auth_hash[:provider]
        uid = auth_hash[:uid]
        nickname = auth_hash[:info][:nickname]
        image_url = auth_hash[:info][:image]

        User.find_or_create_by(provider: provider, uid: uid) do |user|
            user.nickname = nickname
            user.image_url = image_url
        end
    end

    private
    def check_all_events_finished
        now = Time.zone.now
        if created_events.where(':now < end_time', now: now).exists?
            errors[:base] << '公開中の未終了イベントが存在します。'
        end

        if participating_events.where(':now < end_time', now: now).exists?
            errors[:base] << '未終了の参加イベントが存在します。'
        end
        errors.blank?
    end
end
