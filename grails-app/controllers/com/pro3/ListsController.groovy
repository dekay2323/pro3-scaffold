package com.pro3

import grails.transaction.Transactional

@Transactional(readOnly = true)
class ListsController {

    static allowedMethods = []

    def procurementStats(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond (Project.list(params), model:[projectCount: Project.count()], view:'procurementStats')
    }

    def projectList(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond (Project.list(params), model:[projectCount: Project.count()], view:'projectList')
    }

}
