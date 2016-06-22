package com.pro3

import grails.transaction.Transactional

import static org.springframework.http.HttpStatus.CREATED

@Transactional(readOnly = true)
class Flow1Controller {
    def home() {
    }

    def procurementStats(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Project.list(params), model:[projectCount: Project.count()]
    }

    def projectList(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Project.list(params), model:[projectCount: Project.count()]
    }

    def procurementPlan(Project project) {
        respond project
    }

    def showRequestItem(RequestItem requestItem) {
        respond requestItem
    }

    @Transactional
    def saveRequestItem(RequestItem requestItem) {
        if (requestItem == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (requestItem.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond requestItem.errors, view:'create'
            return
        }

        requestItem.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'requestItem.label', default: 'RequestItem'), requestItem.id])
                redirect requestItem
            }
            '*' { respond requestItem, [status: CREATED] }
        }
    }

    def editRequestItem(RequestItem requestItem) {
        respond requestItem
    }
}
