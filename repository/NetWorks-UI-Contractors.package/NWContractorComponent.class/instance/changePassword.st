actions
changePassword
  self validate
    ifTrue: [ 
      self commit.
      self
        call:
          (((self model emailDescription
            beReadonly;
            yourself) , self model passwordDescription asContainer
            componentRenderer: TBSMagritteFormRenderer;
            asComponentOn: self model)
            addDecoration: NWMagritteFormDecoration newWithDefaultButtons;
            addDecoration:
                (AdminLTEBoxDecoration new
                    label:
                        'Change password for ' , (self model readUsing: self model titleDescription);
                    icon: #'lock';
                    yourself);
            yourself) ]