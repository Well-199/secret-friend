-- CreateTable
CREATE TABLE "event" (
    "id" SERIAL NOT NULL,
    "status" BOOLEAN NOT NULL DEFAULT false,
    "title" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "grouped" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "event_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "event_group" (
    "id" SERIAL NOT NULL,
    "id_event" INTEGER NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "event_group_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "event_people" (
    "id" SERIAL NOT NULL,
    "id_event" INTEGER NOT NULL,
    "id_group" INTEGER NOT NULL,
    "name" TEXT NOT NULL,
    "cpf" TEXT NOT NULL,
    "matched" TEXT NOT NULL DEFAULT '',

    CONSTRAINT "event_people_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "event_group" ADD CONSTRAINT "event_group_id_event_fkey" FOREIGN KEY ("id_event") REFERENCES "event"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "event_people" ADD CONSTRAINT "event_people_id_event_fkey" FOREIGN KEY ("id_event") REFERENCES "event"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "event_people" ADD CONSTRAINT "event_people_id_group_fkey" FOREIGN KEY ("id_group") REFERENCES "event_group"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
