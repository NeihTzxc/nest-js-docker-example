import { Column, Entity, Index } from "typeorm";

@Index("social_system_info_pkey", ["slug"], { unique: true })
@Entity("social_system_info", { schema: "public" })
export class SocialSystemInfo {
  @Column("text", { primary: true, name: "slug" })
  slug: string;

  @Column("text", { name: "value", nullable: true })
  value: string | null;

  @Column("smallint", { name: "type", nullable: true })
  type: number | null;
}
