class Contact < ApplicationRecord
    #validates_presence_of :kind
    #validates_presence_of :address

    belongs_to :kind
    has_many :phones
    has_one :address
    
    accepts_nested_attributes_for :phones, allow_destroy: true
    accepts_nested_attributes_for :address, update_only: true

    #def as_json(options={})
    #    h = super(
    #            root: true,
    #            except: [:created_at, :updated_at, :kind_id],
    #            include: {
    #                kind: {
    #                    except: [:created_at, :updated_at]
    #                },
    #                phones:{
    #                    except: [:created_at, :updated_at, :contact_id]
    #                },
    #                address:{
    #                    except: [:created_at, :updated_at, :contact_id]
    #                }
    #            }
    #        )
    #    h["contact"]["birthdate"] = ((self.birthdate).strftime('%d-%m-%Y') unless self.birthdate.blank?)
    #    h
    #end

end
