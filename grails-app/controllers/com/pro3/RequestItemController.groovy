package com.pro3

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class RequestItemController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond RequestItem.list(params), model:[requestCount: RequestItem.count()]
    }

    def show(RequestItem request) {
        respond request
    }

    def create() {
        respond new RequestItem(params)
    }

    @Transactional
    def save(RequestItem request) {
        if (request == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (request.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond request.errors, view:'create'
            return
        }

        request.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'request.label', default: 'Request'), request.id])
                redirect request
            }
            '*' { respond request, [status: CREATED] }
        }
    }

    def edit(RequestItem request) {
        respond request
    }

    @Transactional
    def update(RequestItem request) {
        if (request == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (request.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond request.errors, view:'edit'
            return
        }

        request.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'request.label', default: 'Request'), request.id])
                redirect request
            }
            '*'{ respond request, [status: OK] }
        }
    }

    @Transactional
    def delete(RequestItem request) {

        if (request == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        request.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'request.label', default: 'Request'), request.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'request.label', default: 'Request'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
