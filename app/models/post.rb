class Post < ApplicationRecord
    belongs_to :user
    has_many :images

    #attributes can not be blank
    validates :title, :description, 
    :city_id, :district_id, :ward_id, 
    :address_number, :contact_mobile, 
        presence: true
    #Title
    validates :title, 
        length: {minimum:30, maximum:99}
    #Description
    validates :description,
        length: {minimum:50, maximum:3000}
    #Address of contact and house
    validates :address_number, :contact_address,
        length: {maximum:200}
    #Price, Area, Front, Entrance
    validates :price, :area, :front, :entrance,
        numericality: {only_integer: true, greater_than: 0, less_than_or_equal_to: 999999}
    #Mobile, Phone
    validates :contact_mobile, :contact_phone,
        length: {minimum:10, maximum:14},
        format: {with: /\d[0-9]\)*\z/}
    #Numbers of: Floors, bedrooms, toilets            
    validates :floor, :bedroom, :toilet,
        numericality: {only_integer: true, greater_than:0, less_than_or_equal_to: 999}
    #Description of furniture
    validates :furniture,
        length: {maximum: 200}
    #Name of contact
    validates :contact_name,
        length: {maximum:200},
        format: {with: /\A[a-zA-Z]+\z?/}
    #Email
    validates :contact_mail,
        length: {maximum: 100},
        format: { with:  /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i }

end
