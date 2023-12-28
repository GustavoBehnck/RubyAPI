class Contact < ApplicationRecord
    belongs_to :kind

    def as_json(options={})
        super(
                root: true,
                except: [:created_at, :updated_at, :kind_id],
                include: {
                    kind: {
                        except: [:created_at, :updated_at]
                        }
                    }
            )
    end

end
