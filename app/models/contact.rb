class Contact < ApplicationRecord
    belongs_to :kind
    has_many :phones

    def as_json(options={})
        super(
                root: true,
                except: [:created_at, :updated_at, :kind_id],
                include: {
                    kind: {
                        except: [:created_at, :updated_at]
                    },
                    phones:{
                        except: [:created_at, :updated_at, :id, :contact_id]
                    }
                }
        )
    end

end
