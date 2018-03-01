class Post < ApplicationRecord
    belongs_to :user
    has_many :images

    #attributes can not be blank
    validates :title, :description, 
    :city_id, :district_id, :ward_id, 
    :address_number, :contact_mobile, 
        presence: true

    #Title
    validate :title, 
        length: {minimum:30, maximum:99},
    #Description
    validate :description,
        length: {minimum:50, maximum:3000}
    #Mobile
    validate :contact_mobile,
        length: {minimum:10, maximum:14},
        format: {with: /\d[0-9]\)*\z/}
    #Price, Area
    validate :price, :area
        numericality: {only_integer: true, less_than_or_equal_to: 999999}
    

              



end
