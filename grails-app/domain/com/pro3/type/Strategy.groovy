package com.pro3.type

class Strategy {
    String name

    Date dateCreated
    Date lastUpdated

    static constraints = {
        name nullable: false, blank: false

        dateCreated nullable: false
        lastUpdated nullable: false
    }

}
