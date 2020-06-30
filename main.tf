# Create an arbitrary local resource
data "template_file" "test" {
  template = "Hello, I am a template. My sample_var value = $${sample_var}"

  vars {
    sample_var = "${var.sample_var}"
  }
}

resource "null_resource" "sleep-local" {
  triggers {
    uuid = "${uuid()}"
  }

  provisioner "local-exec" {
    command = "sleep ${var.sleepy_time}"
  }
} 

resource "null_resource" "sleep-remote" {
  triggers {
    uuid = "${uuid()}"
  }
provisioner "remote-exec" {
    inline = ["ping localhost -c 10", "sleep 3", "ping localhost -c 15", "touch test.txt"]
    timeout = "${var.sleepy_time}"
  }
}
