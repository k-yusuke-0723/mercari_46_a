require 'rails_helper'

describe User do
  describe '#create' do

    it "ニックネームなしでは登録できない" do
      user = build(:user, nickname: "")
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end

    it "emailなしでは登録できない" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    it "passwordなしでは登録できない" do
      user = build(:user, password: "")
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    it "password_confirmationなしでは登録できない" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end

    it "last_nameなしでは登録できない" do
      user = build(:user, last_name: "")
      user.valid?
      expect(user.errors[:last_name]).to include("can't be blank")
    end

    it "first_nameなしでは登録できない" do
      user = build(:user, first_name: "")
      user.valid?
      expect(user.errors[:first_name]).to include("can't be blank")
    end

    it "last_name_kanaなしでは登録できない" do
      user = build(:user, last_name_kana: "")
      user.valid?
      expect(user.errors[:last_name_kana]).to include("can't be blank")
    end

    it "first_name_kanaなしでは登録できない" do
      user = build(:user, first_name_kana: "")
      user.valid?
      expect(user.errors[:first_name_kana]).to include("can't be blank")
    end

    it "birthday_yearなしでは登録できない" do
      user = build(:user, birthday_year: "")
      user.valid?
      expect(user.errors[:birthday_year]).to include("can't be blank")
    end

    it "birthday_monthなしでは登録できない" do
      user = build(:user, birthday_month: "")
      user.valid?
      expect(user.errors[:birthday_month]).to include("can't be blank")
    end

    it "birthday_dayなしでは登録できない" do
      user = build(:user, birthday_day: "")
      user.valid?
      expect(user.errors[:birthday_day]).to include("can't be blank")
    end

    it "postcodeなしでは登録できない" do
      user = build(:user, postcode: "")
      user.valid?
      expect(user.errors[:postcode]).to include("can't be blank")
    end

    it "prefectureなしでは登録できない" do
      user = build(:user, prefecture: "")
      user.valid?
      expect(user.errors[:prefecture]).to include("can't be blank")
    end

    it "cityなしでは登録できない" do
      user = build(:user, city: "")
      user.valid?
      expect(user.errors[:city]).to include("can't be blank")
    end

    it "blockなしでは登録できない" do
      user = build(:user, block: "")
      user.valid?
      expect(user.errors[:block]).to include("can't be blank")
    end

    it "nicknameは7文字以上では登録できない" do
      user = build(:user, nickname: "aaaaaaaa")
      user.valid?
      expect(user.errors[:nickname][0]).to include("is too long")
    end

    it "nicknameは6文字以下であれば登録できる" do
      user = build(:user, nickname: "123456")
      expect(user).to be_valid
    end

    it "emailは重複すると登録できない" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("has already been taken")
    end

    it "passwordは7文字以上で登録できる" do
      user = build(:user, password: "1234567")
      user.valid?
    end

    it "passwordは5文字以下では登録できない" do
      user = build(:user, password: "12345")
      user.valid?
      expect(user.errors[:password][0]).to include("is too short")
    end

    it "last_name_kanaは「かな」入力になっていないと登録できない" do
      user = build(:user, last_name_kana: "sumi")
      user.valid?
      expect(user.errors[:last_name_kana]).to include("かなで入力してください")
    end

    it "last_name_kanaは「かな」入力であれば登録できる" do
      user = build(:user, last_name_kana: "すみ")
      user.valid?
    end

    it "first_name_kanaは「かな」入力になっていないと登録できない" do
      user = build(:user, first_name_kana: "yu")
      user.valid?
      expect(user.errors[:first_name_kana]).to include("かなで入力してください")
    end

    it "first_name_kanaは「かな」入力であれば登録できる" do
      user = build(:user, first_name_kana: "ゆう")
      user.valid?
    end

    it "birthday_yearは1900~でないと登録できない" do
      user = build(:user, birthday_year: "1899")
      user.valid?
      expect(user.errors[:birthday_year]).to include("1900年以降で入力してください")
    end

    it "birthday_yearは1900~であれば登録できる" do
      user = build(:user, birthday_year: "1900")
      user.valid?
    end

    it "birthday_monthは1~12でないと登録できない" do
      user = build(:user, birthday_month: "13")
      user.valid?
      expect(user.errors[:birthday_month]).to include("must be less than 12")
    end

    it "birthday_monthは1~12であれば登録できる" do
      user = build(:user, birthday_month: "12")
      user.valid?
    end

    it "birthday_dayは1~31でないと登録できない" do
      user = build(:user, birthday_day: "32")
      user.valid?
      expect(user.errors[:birthday_day]).to include("must be less than 31")
    end

    it "birthday_dayは1~31であれば登録できる" do
      user = build(:user, birthday_day: "31")
      user.valid?
    end

    it "postcodeは123-1234の形でないと登録できない" do
      user = build(:user, postcode: "123-12345")
      user.valid?
      expect(user.errors[:postcode]).to include("123-1234の形で入力してください")
    end

    it "postcodeは123-1234の形であれば登録できる" do
      user = build(:user, postcode: "123-1234")
      user.valid?
    end

  end
end
