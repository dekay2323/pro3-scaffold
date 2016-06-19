package com.pro3

import grails.transaction.Transactional

@Transactional(readOnly = true)
class Flow1Controller {

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Project.list(params), model:[projectCount: Project.count()]
    }
}
